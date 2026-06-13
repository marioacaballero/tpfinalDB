DELIMITER //
CREATE PROCEDURE sp_registrar_prestamo(IN p_id_socio INT, IN p_id_ejemplar INT)
BEGIN
  DECLARE prestamos_activos INT DEFAULT 0;
  DECLARE sanciones_activas INT DEFAULT 0;
  DECLARE ejemplar_disponible VARCHAR(50);
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error al cargar prestamo' AS mensaje;
  END;

  -- Verificar limite de prestamos
  SELECT count(p.id_prestamo) INTO prestamos_activos FROM prestamo p
	WHERE p.id_socio = p_id_socio AND p.id_ejemplar = p_id_ejemplar
	group by p.id_prestamo;

  IF prestamos_activos > 3 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El limite de prestamo se ha superado';
  END IF;

  -- Verificar si hay sanciones activas
  SELECT count(s.id_sancion) INTO sanciones_activas FROM sancion s
	WHERE s.id_socio = p_id_socio AND activa
	GROUP BY s.id_sancion;
  
  IF sanciones_activas > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El socio tiene sanciones activas'

  -- Verificar disponibilidad ejemplar
  SELECT estado_fisico INTO ejemplar_disponible FROM ejemplar
	WHERE id_ejemplar = p_id_ejemplar;

  IF ejemplar_disponible <> 'DISPONIBLE' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El ejemplar no esta disponible'

  START TRANSACTION;
	INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, id_socio, id_ejemplar) VALUES
	(CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY)), p_id_socio, p_id_ejemplar);

	UPDATE libro
	SET stock_disponible = stock_disponible - 1
	WHERE isbn = (SELECT isbn FROM ejemplar WHERE id_ejemplar = p_id_ejemplar);

	UPDATE ejemplar
	SET estado_fisico = 'PRESTADO'
	WHERE id_ejemplar = p_id_ejemplar;
  COMMIT;
  SELECT 'Prestamo cargado' AS mensaje;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_generar_sancion(s_id_socio, tipo, dias_mora)
BEGIN

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registrar_devolucion(IN p_id_prestamo INT)
BEGIN
  DECLARE fecha_dev DATE;
  DECLARE fecha_ven DATE;
  DECLARE socio INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error al procesar el prestamo' AS mensaje;
  END;
  
  SELECT fecha_devolucion, fecha_vencimiento INTO fecha_dev, fecha_ven FROM prestamo
    WHERE id_prestamo = p_id_prestamo;

  IF fecha_dev > fecha_ven THEN
    START TRANSACTION;
	SELECT id_socio INTO socio FROM prestamo
		WHERE id_prestamo = p_id_prestamo;
	
	-- HAY QUE VER QUE TIPO PONEMOS
	CALL sp_generar_sancion(socio, tipo, DATEDIFF(fecha_dev, fecha_ven))
    COMMIT;
  ELSE
    START TRANSACTION;
	UPDATE prestamo 
	SET estado = 'DEVUELTO'
	WHERE id_prestamo = p_id_prestamo;

	UPDATE ejemplar e
	JOIN prestamo p ON e.id_ejemplar = p.id_ejemplar
	SET e.estado_fisico = 'DISPONIBLE'
	WHERE e.id_ejemplar = p_id_ejemplar;

	UPDATE libro
	SET stock_disponible = stock_disponible + 1
	WHERE isbn = (SELECT e.isbn FROM prestamo p
			JOIN ejemplar e ON e.id_ejemplar = p.id_ejemplar
			WHERE p.id_prestamo = p_id_prestamo); 
    COMMIT;
  END IF;
  SELECT 'Prestamo actualizado' AS mensaje;
END //
DELIMITER ;

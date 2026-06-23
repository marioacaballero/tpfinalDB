DELIMITER //
CREATE PROCEDURE sp_registrar_prestamo(IN p_id_socio INT, IN p_id_ejemplar INT)
BEGIN
  DECLARE prestamos_activos INT DEFAULT 0;
  DECLARE sanciones_activas INT DEFAULT 0;
  DECLARE ejemplar_disponible VARCHAR(50);
  DECLARE v_mensaje_error VARCHAR(255) DEFAULT 'Error al cargar prestamo';

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_mensaje_error = MESSAGE_TEXT;
    ROLLBACK;
    SELECT v_mensaje_error AS mensaje;
  END;

  -- Verificar limite de prestamos
  SELECT count(p.id_prestamo) INTO prestamos_activos FROM prestamo p
	WHERE p.id_socio = p_id_socio AND estado = 'ACTIVO';

  IF prestamos_activos >= 3 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El limite de prestamo se ha superado';
  END IF;

  -- Verificar si hay sanciones activas
  SELECT count(s.id_sancion) INTO sanciones_activas FROM sancion s
	WHERE s.id_socio = p_id_socio AND activa;
  
  IF sanciones_activas > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El socio tiene sanciones activas';
  END IF;

  -- Verificar disponibilidad ejemplar
  SELECT estado_fisico INTO ejemplar_disponible FROM ejemplar
	WHERE id_ejemplar = p_id_ejemplar;

  IF ejemplar_disponible <> 'DISPONIBLE' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'El ejemplar no esta disponible';
  END IF;

  START TRANSACTION;
	INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, id_socio, id_ejemplar) VALUES
	(CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), p_id_socio, p_id_ejemplar);

	UPDATE ejemplar
	SET estado_fisico = 'PRESTADO'
	WHERE id_ejemplar = p_id_ejemplar;
  COMMIT;
  SELECT 'Prestamo cargado' AS mensaje;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_generar_sancion(IN s_id_socio INT, IN dias_mora INT)
BEGIN
  DECLARE tipo INT; -- Sacamos el tipo de los parametros ya que lo vimos innecesario
  DECLARE tipo_motivo VARCHAR(100);
  DECLARE v_mensaje_error VARCHAR(255) DEFAULT 'Error al procesar el prestamo';
 
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_mensaje_error = MESSAGE_TEXT;
    ROLLBACK;
    SELECT v_mensaje_error AS mensaje;
  END;

  IF dias_mora > 30 THEN
	SET tipo = 3;
	SET tipo_motivo = 'Demora mayor a 30 dias';
  ELSEIF dias_mora > 15 THEN
	SET tipo = 2;
	SET tipo_motivo = 'Demora mayor a 15 dias';
  ELSE
	SET tipo = 1;
	SET tipo_motivo = 'Demora menor a 15 dias';
  END IF;

  START TRANSACTION;
	INSERT INTO sancion (id_socio, fecha_inicio, id_tipo, motivo)
	VALUES (s_id_socio, CURDATE(), tipo, tipo_motivo);
  COMMIT;

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_registrar_devolucion(IN p_id_prestamo INT)
BEGIN
  DECLARE fecha_dev DATE DEFAULT CURDATE();
  DECLARE fecha_ven DATE;
  DECLARE p_id_ejemplar INT;
  DECLARE socio INT;
  DECLARE v_mensaje_error VARCHAR(255) DEFAULT 'Error al procesar el prestamo';

  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    GET DIAGNOSTICS CONDITION 1 v_mensaje_error = MESSAGE_TEXT;
    ROLLBACK;
    SELECT v_mensaje_error AS mensaje;
  END;
  
  SELECT fecha_vencimiento, id_ejemplar INTO fecha_ven, p_id_ejemplar FROM prestamo
    WHERE id_prestamo = p_id_prestamo;

  IF fecha_dev > fecha_ven THEN
    START TRANSACTION;
	SELECT id_socio INTO socio FROM prestamo
		WHERE id_prestamo = p_id_prestamo;

	UPDATE prestamo 
	SET estado = 'VENCIDO',
		fecha_devolucion = fecha_dev
	WHERE id_prestamo = p_id_prestamo;
	
	CALL sp_generar_sancion(socio, DATEDIFF(fecha_dev, fecha_ven));
    COMMIT;
  ELSE
    START TRANSACTION;
	UPDATE prestamo 
	SET estado = 'DEVUELTO',
		fecha_devolucion = fecha_dev
	WHERE id_prestamo = p_id_prestamo;

	UPDATE ejemplar e
	JOIN prestamo p ON e.id_ejemplar = p.id_ejemplar
	SET e.estado_fisico = 'DISPONIBLE'
	WHERE e.id_ejemplar = p_id_ejemplar;
    COMMIT;
  END IF;
  SELECT 'Prestamo actualizado' AS mensaje;
END //
DELIMITER ;

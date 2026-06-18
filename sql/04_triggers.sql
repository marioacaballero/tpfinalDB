DELIMITER //
CREATE TRIGGER trg_actualizar_stock_insert
AFTER INSERT ON prestamo
FOR EACH ROW
BEGIN
	UPDATE libro
	SET stock_disponible = stock_disponible - 1
	WHERE isbn = (SELECT isbn FROM ejemplar e
			JOIN prestamo p ON e.id_ejemplar = p.id_ejemplar
			WHERE p.id_prestamo = NEW.id_prestamo);
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_actualizar_stock_update
AFTER UPDATE ON prestamo
FOR EACH ROW
BEGIN
	IF NEW.estado <> 'ACTIVO' THEN
		UPDATE libro
		SET stock_disponible = stock_disponible + 1
		WHERE isbn = (SELECT isbn FROM ejemplar e
				JOIN prestamo p ON e.id_ejemplar = p.id_ejemplar
				WHERE p.id_prestamo = NEW.id_prestamo);
	END IF;
END //

DELIMITER ;


DELIMITER //
CREATE TRIGGER trg_estado_socio
AFTER INSERT ON sancion
FOR EACH ROW
BEGIN
	UPDATE socio
	SET estado = 'SUSPENDIDO'
	WHERE id_socio = NEW.id_socio;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_audit_prestamo_insert
AFTER INSERT ON prestamo
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_prestamos (id_prestamo, motivo, usuario)
	VALUES (NEW.id_prestamo, 'CREADO', USER());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_audit_prestamo_update
AFTER UPDATE ON prestamo
FOR EACH ROW
BEGIN
  IF (NEW.fecha_devolucion <=> OLD.fecha_devolucion) OR (NEW.fecha_vencimiento <=> OLD.fecha_vencimiento) THEN
    INSERT INTO auditoria_prestamos (id_prestamo, motivo, usuario)
    VALUES (NEW.id_prestamo, NEW.estado, USER());
  END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_audit_prestamo_delete
AFTER DELETE ON prestamo
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_prestamos (id_prestamo, motivo, usuario)
	VALUES (OLD.id_prestamo, 'BORRADO', USER());
END //

DELIMITER ;

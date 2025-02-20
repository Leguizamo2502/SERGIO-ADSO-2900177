DELIMITER $$

-- **--------------
-- INSERTAR NORMAL PARA Prestamo
-- **-------------
CREATE PROCEDURE insert_prestamo(IN fecha_prestamo_p DATE,IN fecha_devolucion_p DATE, IN id_usuario_p INT)
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM Prestamo WHERE id_prestamo = id_prestamo AND id_usuario = id_usuario_p) THEN
        INSERT INTO Prestamo (fecha_prestamo,fecha_devolucion, id_usuario)
        VALUES (fecha_prestamo_p,fecha_devolucion_p, id_usuario_p);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El prestamo ya existe';
    END IF;
END $$

-- **--------------
-- Modificar NORMAL PARA Prestamo
-- **-------------
CREATE PROCEDURE modificar_prestamo(IN id_prestamo_p INT,IN fecha_prestamo_p DATE, IN fecha_devolucion_p DATE,IN id_usuario_p INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Prestamo WHERE id_prestamo = id_prestamo AND id_usuario_p) THEN
        UPDATE Prestamo
        SET fecha_prestamo = fecha_prestamo_p, 
            fecha_devolucion = fecha_devolucion_p,
            id_usuario = id_usuario_p 
        WHERE id_prestamo = id_prestamo_p;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El prestamo no existe';
    END IF;
END $$

-- **--------------
-- Eliminar NORMAL PARA Prestamo
-- **-------------
CREATE PROCEDURE eliminar_prestamo(IN id_prestamo_p INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Prestamo WHERE id_prestamo = id_prestamo) THEN
        DELETE FROM Prestamo 
        WHERE id_prestamo = id_prestamo_p;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El prestamo no existe';
    END IF;
END $$

-- **----------------
-- INSERTAR DEFINITIVO PARA Prestamo
-- **----------------
CREATE PROCEDURE insert_prestamo_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en insertar prestamo';
    END;
    START TRANSACTION;
    CALL insert_prestamo('2024-11-10','2024-11-12',1);
    CALL insert_prestamo('2024-11-11','2024-11-13',2);
    CALL insert_prestamo('2024-11-12','2024-11-14',3);
    CALL insert_prestamo('2024-11-13','2024-11-16',4);

    COMMIT;
END $$

-- **----------------
-- Modificar DEFINITIVO PARA Prestamo
-- **----------------
CREATE PROCEDURE modificar_prestamo_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en modificar prestamo';
    END;
    START TRANSACTION;
    CALL modificar_prestamo(1,'2024-11-15', '2024-11-18', 1);
    CALL modificar_prestamo(2,'2024-11-16', '2024-11-19', 2);

    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO PARA Prestamo
-- **----------------
CREATE PROCEDURE eliminar_prestamo_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en eliminar prestamo';
    END;
    START TRANSACTION;
    CALL eliminar_prestamo(4);

    COMMIT;
END $$

-- **----------------
-- Prestamo God
-- **----------------
CREATE PROCEDURE prestamo_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en prestamo god';
    END;
    START TRANSACTION;
    CALL insert_prestamo_def();
    CALL modificar_prestamo_def();
    CALL eliminar_prestamo_def();

    COMMIT;
END $$

DELIMITER ;
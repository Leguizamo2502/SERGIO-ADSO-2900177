DELIMITER $$

-- **--------------------------
-- INSERTAR NORMAL PARA Detalle
-- **--------------------------
CREATE PROCEDURE insert_detalle(IN cantidad_d INT,IN id_libro_d INT,IN id_prestamo_d INT) 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM Detalle WHERE id_libro = id_libro_d AND id_prestamo = id_prestamo_d) THEN
        INSERT INTO Detalle (cantidad,id_libro,id_prestamo)
        VALUES (cantidad_d,id_libro_d,id_prestamo_d);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El detalle ya existe';
    END IF;
END $$

-- **---------------------------
-- Modificar NORMAL PARA Detalle
-- **---------------------------
CREATE PROCEDURE modificar_detalle(IN id_detalle_d INT,IN cantidad_d INT,IN id_libro_d INT,IN id_prestamo_d INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Detalle WHERE id_libro = id_libro_d AND id_prestamo = id_prestamo_d) THEN
        UPDATE Detalle
        SET cantidad = cantidad_d,
        id_libro = id_libro_d,
        id_prestamo = id_prestamo_d
        WHERE id_detalle = id_detalle_d;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El detalle no existe';
    END IF;
END $$

-- **--------------------------
-- Eliminar NORMAL PARA Detalle
-- **--------------------------
CREATE PROCEDURE eliminar_detalle(IN id_detalle_d INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Detalle WHERE id_detalle = id_detalle) THEN
        DELETE FROM Detalle WHERE id_detalle = id_detalle_d;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El detalle no existe';
    END IF;
END $$

-- **------------------------------
-- INSERTAR DEFINITIVO PARA Detalle
-- **------------------------------
CREATE PROCEDURE insert_detalle_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en insertar detalle';
    END;
    START TRANSACTION;
    CALL insert_detalle(1,1,1);
    CALL insert_detalle(6,2,2);
    CALL insert_detalle(3,3,3);

    COMMIT;
END $$

-- **-------------------------------
-- Modificar DEFINITIVO PARA Detalle
-- **-------------------------------
CREATE PROCEDURE modificar_detalle_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en modificar detalle';
    END;
    START TRANSACTION;
    CALL modificar_detalle(1,3,1,1);
    CALL modificar_detalle(2,2,2,2);

    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO PARA Detalle
-- **----------------
CREATE PROCEDURE eliminar_detalle_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en eliminar detalle';
    END;
    START TRANSACTION;
    CALL eliminar_detalle(3);

    COMMIT;
END $$

-- **----------------
-- Detalle God
-- **----------------
CREATE PROCEDURE detalle_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en detalle god';
    END;
    START TRANSACTION;
    CALL insert_detalle_def();
    CALL modificar_detalle_def();
    CALL eliminar_detalle_def();

    COMMIT;
END $$

DELIMITER ;

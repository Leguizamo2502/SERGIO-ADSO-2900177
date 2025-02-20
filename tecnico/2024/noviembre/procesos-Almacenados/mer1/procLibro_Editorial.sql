DELIMITER $$

-- **--------------
-- INSERTAR NORMAL PARA Libro_Editorial
-- **-------------
CREATE PROCEDURE insert_libro_editorial(IN id_libro_le INT, IN id_editorial_le INT)
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM Libro_Editorial WHERE id_libro = id_libro_le OR id_editorial = id_editorial_le) THEN
        INSERT INTO Libro_Editorial (id_libro, id_editorial)
        VALUES (id_libro_le, id_editorial_le);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-editorial ya existe';
    END IF;
END $$

-- **--------------
-- Modificar NORMAL PARA Libro_Editorial
-- **-------------
CREATE PROCEDURE modificar_libro_editorial(IN id_le INT,IN id_libro_le INT, IN id_editorial_le INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Libro_Editorial WHERE id_libro = id_libro_le AND id_editorial = id_editorial_le) THEN
        UPDATE Libro_Editorial
        SET id_libro = id_libro_le,
            id_editorial = id_editorial_le
        WHERE id_libro_editorial=id_le;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-editorial no existe';
    END IF;
END $$

-- **--------------
-- Eliminar NORMAL PARA Libro_Editorial
-- **-------------
CREATE PROCEDURE eliminar_libro_editorial(IN id_libro_editorial_le INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Libro_Editorial WHERE id_libro_editorial = id_libro_editorial_le) THEN
        DELETE FROM Libro_Editorial WHERE id_libro_editorial = id_libro_editorial_le;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-editorial no existe';
    END IF;
END $$

-- **----------------
-- INSERTAR DEFINITIVO PARA Libro_Editorial
-- **----------------

CREATE PROCEDURE insert_libro_editorial_def()
    BEGIN
        
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en insertar libro-editorial';
        END;
        START TRANSACTION;
        CALL insert_libro_editorial(1,2);
        CALL insert_libro_editorial(2,1);
        CALL insert_libro_editorial(3,3);

        
        COMMIT;
    END $$

-- **----------------
-- Modificar DEFINITIVO PARA Libro_Editorial
-- **----------------
CREATE PROCEDURE modificar_libro_editorial_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en modificar libro-editorial';
    END;
    START TRANSACTION;
    CALL modificar_libro_editorial(1,1,3);
    CALL modificar_libro_editorial(2,3,2);

    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO PARA Libro_Editorial
-- **----------------
CREATE PROCEDURE eliminar_libro_editorial_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en eliminar libro-editorial';
    END;
    START TRANSACTION;
    CALL eliminar_libro_editorial(3);

    COMMIT;
END $$

-- **----------------
-- Libro_Editorial God
-- **----------------
CREATE PROCEDURE Libro_Editorial_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en libro-editorial god';
    END;
    START TRANSACTION;
    CALL insert_libro_editorial_def();
    CALL modificar_libro_editorial_def();
    CALL eliminar_libro_editorial_def();

    COMMIT;
END $$

DELIMITER ;
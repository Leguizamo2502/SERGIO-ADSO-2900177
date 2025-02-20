DELIMITER $$

-- **--------------
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_editorial(IN nombre_e VARCHAR(50))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Editorial WHERE nombre = nombre_e) THEN
        INSERT INTO Editorial (nombre)
        VALUES (nombre_e);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La editorial ya existe';
    END IF;
END $$

-- **-----------------
-- Modificar normal
-- **-----------------
CREATE PROCEDURE modificar_editorial(
    IN id_e INT,
    IN nombre_e VARCHAR(50)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Editorial WHERE id_editorial = id_e) THEN
        UPDATE Editorial
        SET nombre = nombre_e
        WHERE id_editorial = id_e;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Editorial no encontrada';
    END IF;
END $$

-- **--------------
-- Borrar normal
-- **--------------
CREATE PROCEDURE eliminar_editorial(IN id_e INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Editorial WHERE id_editorial = id_e) THEN
        DELETE FROM Editorial WHERE id_editorial = id_e;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Editorial no encontrada';
    END IF;
END $$

-- **--------------------
-- Insertar definitivo
-- **--------------------
CREATE PROCEDURE insert_editorial_def()
BEGIN
    DECLARE editorialError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al insertar editorial.';
    END;
    START TRANSACTION;

    CALL insert_editorial('Planeta');
    CALL insert_editorial('Penguin Random House');
    CALL insert_editorial('Anagrama');
    CALL insert_editorial('Alfaguara');
    CALL insert_editorial('Salamandra');

    SET editorialError = NULL;
    COMMIT;
END $$

-- **--------------------
-- Modificar definitivo
-- **--------------------
CREATE PROCEDURE modificar_editorial_def()
BEGIN
    DECLARE editorialError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al modificar editorial.';
    END;
    START TRANSACTION;

    CALL modificar_editorial(1, 'Planeta Internacional');
    CALL modificar_editorial(2, 'Penguin Random House Grupo Editorial');
    
    SET editorialError = NULL;
    COMMIT;
END $$

-- **-------------------------
-- Eliminar definitivo
-- **-------------------------
CREATE PROCEDURE eliminar_editorial_def()
BEGIN
    DECLARE editorialError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al eliminar editorial.';
    END;
    START TRANSACTION;

    CALL eliminar_editorial(5);
    
    SET editorialError = NULL;
    COMMIT;
END $$

-- **---------------
-- God editorial
-- **---------------
CREATE PROCEDURE editorial_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en las transacciones god editorial';
    END;

    START TRANSACTION;
    CALL insert_editorial_def();
    CALL modificar_editorial_def();
    CALL eliminar_editorial_def();

    COMMIT;
    SELECT 'Transacción de editorial god completada' AS resultado;
END $$

DELIMITER ;
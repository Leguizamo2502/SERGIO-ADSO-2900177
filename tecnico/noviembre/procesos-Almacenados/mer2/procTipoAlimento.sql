DELIMITER $$

-- **-------------- 
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_tipoAlimento(IN nombre_ta VARCHAR(30))
    BEGIN
    IF NOT EXISTS (SELECT 1 FROM tipoAlimento WHERE nombre = nombre_ta) THEN
        INSERT INTO tipoAlimento(nombre)
        VALUES (nombre_ta);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Error, el tipo de alimento ya está registrado';
    END IF;
END $$

-- **-------------- 
-- Modificar normal
-- **--------------
CREATE PROCEDURE modificar_tipoAlimento(IN id_ta INT, IN nombre_ta VARCHAR(30))
    BEGIN
    IF EXISTS (SELECT 1 FROM tipoAlimento WHERE id_tipoAlimento = id_ta) THEN
        UPDATE tipoAlimento
        SET nombre = nombre_ta
        WHERE id_tipoAlimento = id_ta;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Error, error al modificar tipo de alimento';
    END IF;
END $$

-- **-------------- 
-- Eliminar normal
-- **--------------
CREATE PROCEDURE eliminar_tipoAlimento(IN id_ta INT)
    BEGIN
    IF EXISTS (SELECT 1 FROM tipoAlimento WHERE id_tipoAlimento = id_ta) THEN
        DELETE FROM tipoAlimento WHERE id_tipoAlimento = id_ta;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Error, error al eliminar tipo de alimento';
    END IF;
END $$

-- **------------------ 
-- Insertar DEFINITIVO
-- **------------------
CREATE PROCEDURE insert_tipoAlimento_def()
BEGIN
    DECLARE tipoAlimentoError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al insertar tipo de alimento def';
    END;
    START TRANSACTION;
    CALL insert_tipoAlimento('Carne');
    CALL insert_tipoAlimento('Frutas');
    CALL insert_tipoAlimento('Vegetales');
    CALL insert_tipoAlimento('Insectos');
    CALL insert_tipoAlimento('Pescado');

    SET tipoAlimentoError = NULL;
    COMMIT;
END $$

-- **------------------ 
-- Modificar DEFINITIVO
-- **------------------
CREATE PROCEDURE modificar_tipoAlimento_def()
BEGIN   
    DECLARE tipoAlimentoError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al modificar tipo de alimento def';
    END;
    START TRANSACTION;
    CALL modificar_tipoAlimento(1, 'Carne y Huesos');
    CALL modificar_tipoAlimento(2, 'Frutas Tropicales');

    SET tipoAlimentoError = NULL;
    COMMIT;
END $$

-- **------------------ 
-- Eliminar DEFINITIVO
-- **------------------
CREATE PROCEDURE eliminar_tipoAlimento_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar tipo de alimento def';
    END;

    START TRANSACTION;
    CALL eliminar_tipoAlimento(5);

    COMMIT;
END $$

-- **------------------ 
-- TipoAlimento god
-- **------------------
CREATE PROCEDURE tipoAlimento_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en tipo de alimento god';
    END;
    START TRANSACTION;
    CALL insert_tipoAlimento_def();
    CALL modificar_tipoAlimento_def();
    CALL eliminar_tipoAlimento_def();

    COMMIT;
END $$

DELIMITER ;

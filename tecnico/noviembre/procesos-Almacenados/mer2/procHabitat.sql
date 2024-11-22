DELIMITER $$

-- **--------------
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_habitat (
    IN nombre_h VARCHAR(30),
    IN tipo_h VARCHAR(30),
    IN capacidad_h INT,
    IN id_zoologico_h INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE nombre = nombre_h AND id_zoologico = id_zoologico_h
    ) THEN
        INSERT INTO habitat(nombre, tipo, capacidad, id_zoologico)
        VALUES (nombre_h, tipo_h, capacidad_h, id_zoologico_h);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en insertar, el hábitat ya existe';
    END IF;
END $$

-- **--------------
-- Modificar normal
-- **--------------
CREATE PROCEDURE modificar_habitat (
    IN id_h INT,
    IN nombre_h VARCHAR(30),
    IN tipo_h VARCHAR(30),
    IN capacidad_h INT,
    IN id_zoologico_h INT
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE id_habitat = id_h AND id_zoologico = id_zoologico_h
    ) THEN
        UPDATE habitat
        SET nombre = nombre_h,
            tipo = tipo_h,
            capacidad = capacidad_h,
            id_zoologico = id_zoologico_h
        WHERE id_habitat = id_h;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$

-- **--------------
-- Eliminar normal
-- **--------------
CREATE PROCEDURE eliminar_habitat (IN id_h INT)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE id_habitat = id_h
    ) THEN
        DELETE FROM habitat WHERE id_habitat = id_h;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en eliminar';
    END IF;
END $$

-- **--------------
-- Insertar DEFINITIVO
-- **--------------
CREATE PROCEDURE insert_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar def';
    END;
    START TRANSACTION;
    CALL insert_habitat('Sabana', 'Terrestre', 15, 1);
    CALL insert_habitat('Arrecife', 'Acuático', 10, 2);
    CALL insert_habitat('Bosque', 'Selvático', 20, 3);
    CALL insert_habitat('Desierto', 'Árido', 5, 4);
    COMMIT;
END $$

-- **-------------------
-- Modificar DEFINITIVO
-- **-------------------
CREATE PROCEDURE modificar_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar def';
    END;
    START TRANSACTION;
    CALL modificar_habitat(1, 'Pradera', 'Terrestre', 18, 1);
    CALL modificar_habitat(2, 'Laguna', 'Acuático', 12, 2);
    COMMIT;
END $$

-- **-------------------
-- Eliminar DEFINITIVO
-- **-------------------
CREATE PROCEDURE eliminar_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar def';
    END;
    START TRANSACTION;
    CALL eliminar_habitat(4);
    COMMIT;
END $$

-- **-------------------
-- Habitat GOD
-- **-------------------
CREATE PROCEDURE habitat_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en habitat god';
    END;
    START TRANSACTION;
    CALL insert_habitat_def();
    CALL modificar_habitat_def();
    CALL eliminar_habitat_def();
    COMMIT;
END $$

DELIMITER ;

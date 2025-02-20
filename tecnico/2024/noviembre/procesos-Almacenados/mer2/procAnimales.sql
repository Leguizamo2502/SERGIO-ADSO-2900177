DELIMITER $$

-- **----------------
-- Insertar Normal
-- ** ---------------
CREATE PROCEDURE insert_animal(
    IN nombre_a VARCHAR(30),
    IN genero_a VARCHAR(30),
    IN id_es INT,
    IN id_hab INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales WHERE nombre = nombre_a AND id_es AND id_habitat = id_hab) THEN
        INSERT INTO animales(nombre, genero, id_especie, id_habitat)
        VALUES (nombre_a, genero_a, id_es, id_hab);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal ya está registrado';
    END IF;
END $$ 

-- **----------------
-- Modificar Normal
-- ** ---------------
CREATE PROCEDURE modificar_animal(
    IN id_a INT,
    IN nombre_a VARCHAR(30),
    IN genero_a VARCHAR(30),
    IN id_es INT,
    IN id_hab INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales WHERE nombre = nombre_a AND id_especie = id_es AND id_habitat = id_hab) THEN
        UPDATE animales
        SET nombre = nombre_a,
            genero = genero_a,
            id_especie = id_es,
            id_habitat = id_hab
        WHERE id_animal = id_a;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$ 

-- **----------------
-- Eliminar Normal
-- ** ---------------
CREATE PROCEDURE eliminar_animal(IN id_a INT)
BEGIN
    IF EXISTS (SELECT 1 FROM animales WHERE id_animal = id_a) THEN
        DELETE FROM animales WHERE id_animal = id_a;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal no existe';
    END IF;
END $$ 

-- **----------------
-- Insertar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE insert_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar def';
    END;
    START TRANSACTION;
    CALL insert_animal('Tigre', 'Macho', 1, 1);
    CALL insert_animal('Cebra', 'Hembra', 2, 2);
    CALL insert_animal('Pingüino', 'Macho', 3, 3);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Modificar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE modificar_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar def';
    END;
    START TRANSACTION;
    CALL modificar_animal(1, 'Tigre Blanco', 'Macho', 1, 1);
    CALL modificar_animal(2, 'Cebra Rayada', 'Hembra', 2, 2);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE eliminar_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar def';
    END;
    START TRANSACTION;
    CALL eliminar_animal(3);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Animal GOD
-- ** ---------------
CREATE PROCEDURE animal_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en animal god';
    END;
    START TRANSACTION;
    CALL insert_animal_def();
    CALL modificar_animal_def();
    CALL eliminar_animal_def();
    COMMIT;
END $$

DELIMITER ;

DELIMITER $$

-- **----------------
-- Insertar Normal
-- ** ---------------
CREATE PROCEDURE insert_animales_alimentos(IN cantidad_dia_a INT, IN id_animal_a INT, IN id_alimento_a INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales_alimentos WHERE id_animal = id_animal_a AND id_alimento = id_alimento_a) THEN
        INSERT INTO animales_alimentos(cantidad_dia, id_animal, id_alimento)
        VALUES(cantidad_dia_a, id_animal_a, id_alimento_a);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, la relación animal-alimento ya está registrada';
    END IF;
END $$

-- **----------------
-- Modificar Normal
-- ** ---------------
CREATE PROCEDURE modificar_animales_alimentos(IN id_aa INT, IN cantidad_dia_a INT, IN id_animal_a INT, IN id_alimento_a INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales_alimentos WHERE id_animal = id_animal_a AND id_alimento = id_alimento_a) THEN
        UPDATE animales_alimentos
        SET cantidad_dia = cantidad_dia_a,
            id_animal = id_animal_a,
            id_alimento = id_alimento_a
        WHERE id_animales_alimentos = id_aa;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar la relación';
    END IF;
END $$

-- **----------------
-- Eliminar Normal
-- ** ---------------
CREATE PROCEDURE eliminar_animales_alimentos(IN id_aa INT)
BEGIN
    IF EXISTS (SELECT 1 FROM animales_alimentos WHERE id_animales_alimentos = id_aa) THEN
        DELETE FROM animales_alimentos WHERE id_animales_alimentos = id_aa;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en eliminar la relación';
    END IF;
END $$

-- **----------------
-- Insertar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE insert_animales_alimentos_def()
BEGIN
    DECLARE animales_alimentosError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar def';
    END;
    START TRANSACTION;
    CALL insert_animales_alimentos(5, 1, 1); 
    CALL insert_animales_alimentos(10, 2, 2); 
    CALL insert_animales_alimentos(3, 1, 3);  

    SET animales_alimentosError = NULL;
    COMMIT;
END $$

-- **----------------
-- Modificar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE modificar_animales_alimentos_def()
BEGIN
    DECLARE animales_alimentosError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar def';
    END;
    START TRANSACTION;
    CALL modificar_animales_alimentos(1, 6, 2, 1); 
    CALL modificar_animales_alimentos(2, 12, 1, 2); 

    SET animales_alimentosError = NULL;
    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE eliminar_animales_alimentos_def()
BEGIN
    DECLARE animales_alimentosError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar def';
    END;
    START TRANSACTION;
    CALL eliminar_animales_alimentos(3);   

    SET animales_alimentosError = NULL;
    COMMIT;
END $$

-- **----------------
-- animales_alimentos god
-- ** ---------------
CREATE PROCEDURE animales_alimentos_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en animales_alimentos god';
    END;
    CALL insert_animales_alimentos_def();
    CALL modificar_animales_alimentos_def();
    CALL eliminar_animales_alimentos_def();
    COMMIT;
END $$

DELIMITER ;
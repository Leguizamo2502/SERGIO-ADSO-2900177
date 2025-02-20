DELIMITER $$

-- **----------------
-- Insertar Normal
-- **----------------
CREATE PROCEDURE insert_listaAnimales(IN id_z INT, IN id_a INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM listaAnimales WHERE id_zoologico = id_z AND id_animal = id_a) THEN
        INSERT INTO listaAnimales(id_zoologico, id_animal)
        VALUES (id_z, id_a);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal ya está registrado en esta lista.';
    END IF;
END $$
DELIMITER ;
-- **----------------
-- Modificar Normal
-- **----------------

DELIMITER $$

CREATE PROCEDURE modificar_listaAnimales(IN id_l INT, IN id_z INT, IN id_a INT)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM listaAnimales 
        WHERE id_zoologico = id_z AND id_animal = id_a
    ) THEN
        UPDATE listaAnimales
        SET id_zoologico = id_z,
            id_animal = id_a
        WHERE id_listaAnimales = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$

DELIMITER ;


DELIMITER $$
-- **----------------
-- Eliminar Normal
-- **----------------
CREATE PROCEDURE eliminar_listaAnimales(IN id_l INT)
BEGIN
    IF EXISTS (SELECT 1 FROM listaAnimales WHERE id_listaAnimales = id_l) THEN
        DELETE FROM listaAnimales WHERE id_listaAnimales = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en eliminar';
    END IF;
END $$

-- **----------------
-- Insertar Definitivo
-- **----------------
CREATE PROCEDURE insert_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar definitivo';
    END;
    START TRANSACTION;
    CALL insert_listaAnimales(1, 1);
    CALL insert_listaAnimales(2, 2);
    CALL insert_listaAnimales(2, 1);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- Modificar Definitivo
-- **----------------
CREATE PROCEDURE modificar_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar definitivo';
    END;
    START TRANSACTION;
    CALL modificar_listaAnimales(1, 1, 2);
    CALL modificar_listaAnimales(2, 3, 2);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- Eliminar Definitivo
-- **----------------
CREATE PROCEDURE eliminar_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar definitivo';
    END;
    START TRANSACTION;
    CALL eliminar_listaAnimales(2);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- ListaAnimales GOD
-- **----------------
CREATE PROCEDURE listaAnimales_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en listaAnimales GOD';
    END;
    START TRANSACTION;
    CALL insert_listaAnimales_def();
    CALL modificar_listaAnimales_def();
    CALL eliminar_listaAnimales_def();
    COMMIT;
END $$

DELIMITER ;


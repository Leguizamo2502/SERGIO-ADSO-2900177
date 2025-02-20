DELIMITER $$
     -- **--------------
    -- Insertar normal
    -- **--------------
    CREATE PROCEDURE insert_especie(IN nombre_e VARCHAR(30))
        BEGIN
        IF NOT EXISTS (SELECT 1 FROM especie WHERE nombre = nombre_e) THEN
            INSERT INTO especie(nombre)
            VALUES (nombre_e);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, la especie ya esta registrada';
        END IF;
    END $$


    DELIMITER $$
    CREATE PROCEDURE insertCliente (IN p_nombre VARCHAR(25), IN p_telefono int )
    BEGIN
    INSERT INTO (nombre, telefono) VALUES (p_nombre, p_telefono);
    END $$
    DELIMITER ;

    CALL insertCliente ('isa', 3203249)
     -- **--------------
    -- Mofificar normal
    -- **--------------
    CREATE PROCEDURE modificar_especie(IN id_e INT,IN nombre_e VARCHAR(30))
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            IF NOT EXISTS (SELECT 1 FROM especie WHERE nombre = nombre_e) THEN
                UPDATE especie
                SET nombre = nombre_e
                WHERE id_especie = id_e;
            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT ='Error, error en modificar especie';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error, error en modificar especie';
        END IF;
    END $$

     -- **--------------
    -- Eliminar normal
    -- **--------------
    CREATE PROCEDURE eliminar_especie(IN id_e INT)
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            DELETE FROM especie WHERE id_especie = id_e;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, error en eliminar especie';
        END IF;
    END $$


    -- **------------------
    -- Insertar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE insert_especie_def()
    BEGIN
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al insertar def';
        END;
        START TRANSACTION;
        CALL insert_especie('Felino');
        CALL insert_especie('Ave');
        CALL insert_especie('Reptil');
        CALL insert_especie('Mamífero');

        SET especieError=NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Modificar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE modificar_especie_def()
    BEGIN   
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al modificar def';
        END;
        START TRANSACTION;
        CALL modificar_especie(1,'Canino');
        CALL modificar_especie(2,'Anfibio');

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Eliminar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE eliminar_especie_def()
    BEGIN
        DECLARE especieError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en eliminar def';
        END;
        START TRANSACTION;
        CALL eliminar_especie(4);

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Especie god
    -- **------------------
    CREATE PROCEDURE especie_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en especie god';
        END;
        START TRANSACTION;
        CALL insert_especie_def();
        CALL modificar_especie_def();
        CALL eliminar_especie_def();

        COMMIT;
    END $$


DELIMITER ;

call especie_god();

CALL insert_especie_def();
call modificar_especie_def();
CALL eliminar_especie_def();
select * from especie;




   
    
DELIMITER $$
     -- **--------------
    -- Insertar normal
    -- **--------------
    CREATE PROCEDURE insert_especie(IN nombre_e VARCHAR(30))
        BEGIN
        IF NOT EXISTS (SELECT 1 FROM especie WHERE nombre = nombre_e) THEN
            INSERT INTO especie(nombre)
            VALUES (nombre_e);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, la especie ya esta registrada';
        END IF;
    END $$

     -- **--------------
    -- Mofificar normal
    -- **--------------
    CREATE PROCEDURE modificar_especie(IN id_e INT,IN nombre_e VARCHAR(30))
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            UPDATE especie
            SET nombre = nombre_e
            WHERE id_especie = id_e;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error, error en modificar especie';
        END IF;
    END $$

     -- **--------------
    -- Eliminar normal
    -- **--------------
    CREATE PROCEDURE eliminar_especie(IN id_e INT)
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            DELETE FROM especie WHERE id_especie = id_e;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, error en eliminar especie';
        END IF;
    END $$


    -- **------------------
    -- Insertar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE insert_especie_def()
    BEGIN
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al insertar def';
        END;
        START TRANSACTION;
        CALL insert_especie('Felino');
        CALL insert_especie('Ave');
        CALL insert_especie('Reptil');
        CALL insert_especie('Mamífero');

        SET especieError=NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Modificar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE modificar_especie_def()
    BEGIN   
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al modificar def';
        END;
        START TRANSACTION;
        CALL modificar_especie(1,'Canino');
        CALL modificar_especie(2,'Anfibio');

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Eliminar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE eliminar_especie_def()
    BEGIN
        DECLARE especieError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en eliminar def';
        END;
        START TRANSACTION;
        CALL eliminar_especie(4);

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Especie god
    -- **------------------
    CREATE PROCEDURE especie_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en especie god';
        END;
        START TRANSACTION;
        CALL insert_especie_def();
        CALL modificar_especie_def();
        CALL eliminar_especie_def();

        COMMIT;
    END $$


DELIMITER ;





   
    

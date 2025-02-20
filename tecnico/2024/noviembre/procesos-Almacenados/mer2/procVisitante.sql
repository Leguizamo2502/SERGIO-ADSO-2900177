DELIMITER $$
    -- **--------------
    -- Insertar normal
    -- **--------------
    CREATE PROCEDURE insert_visitante (IN nombre_v VARCHAR(30),IN fecha_visita_v DATE,IN id_zoologico_v INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM visitante WHERE id_zoologico = id_zoologico AND nombre = nombre_v) THEN
            INSERT INTO visitante(nombre,fecha_visita,id_zoologico)
            VALUES (nombre_v,fecha_visita_v,id_zoologico_v);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en insertar, el visitante ya existe';
        END IF;
    END $$

    -- **--------------
    -- Mofificar normal
    -- **--------------
    CREATE PROCEDURE modificar_visitante (IN id_v INT,nombre_v VARCHAR(30),IN fecha_visita_v DATE, IN id_zoologico_v INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM visitante WHERE id_visitante = id_v AND id_zoologico = id_zoologico_v) THEN
            UPDATE visitante
            SET nombre = nombre_v,
            fecha_visita = fecha_visita_v,
            id_zoologico = id_zoologico_v
            WHERE id_visitante = id_zoologico_v;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en modificar';
        END IF;
    END $$
    -- **--------------
    -- Eliminar normal
    -- **--------------
    CREATE PROCEDURE eliminar_visitante (IN id_v INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM visitante WHERE id_visitante = id_v) THEN
            DELETE FROM visitante WHERE id_visitante = id_v;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en eliminar';
        END IF;
    END $$

    -- **--------------
    -- Insertar DEFENITIVO  
    -- **--------------
        CREATE PROCEDURE insert_visitante_def()
        BEGIN 
            DECLARE visitanteError INT;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error en insertar def';
            END;
            START TRANSACTION;
            CALL insert_visitante('Ruben Leguizamo','12-11-24',1);
            CALL insert_visitante('Ana Gómez','2024-11-13', 2);
            CALL insert_visitante('Carlos López','2024-11-15', 3);
            CALL insert_visitante('María Fernández','2024-11-18', 4);
            

            COMMIT;
        END $$

    -- **-------------------
    -- Modificar DEFENITIVO  
    -- **------------------
        CREATE PROCEDURE modificar_visitante_def()
        BEGIN
            DECLARE visitanteError INt;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Érror en modificar def';
            END;
            START TRANSACTION;
            CALL modificar_visitante(1,'Sergio Leguizamo','10-20-24',1);
            CALL modificar_visitante(2,'Loren Leguizamo','10-20-24',2);
            COMMIT;
        END $$

    -- **-------------------
    -- Eliminar DEFENITIVO  
    -- **------------------
        CREATE PROCEDURE eliminar_visitante_def()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error en eliminar def';
            END;
            START TRANSACTION;
            CALL eliminar_visitante(4);
            COMMIT;
        END $$

        -- **-------------------
    -- visitamnte GOD 
    -- **------------------

    CREATE PROCEDURE visitante_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en visitante god';
        END;
        START TRANSACTION;
        CALL insert_visitante_def();
        CALL modificar_visitante_def();
        CALL eliminar_visitante_def();

        COMMIT;
    END $$
    

DELIMITER ;
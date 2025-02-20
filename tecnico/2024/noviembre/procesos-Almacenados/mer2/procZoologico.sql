DELIMITER $$
    -- **--------------
    -- Insetar normal
    -- **--------------
    CREATE PROCEDURE insert_zoologico(IN nombre_z VARCHAR(30), IN direccion_z VARCHAR(30))
        BEGIN
        IF NOT EXISTS (SELECT 1 FROM zoologico WHERE nombre = nombre_z AND direccion= direccion_z) THEN
            INSERT INTO zoologico(nombre,direccion)
            VALUES (nombre_z,direccion_z);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error,el zoologico ya existe';
        END IF;
    END $$


    -- **-----------------
    -- Modificar normal
    -- **-----------------
    CREATE PROCEDURE modificar_zoologico(IN id_z INT, IN nombre_z VARCHAR(30), IN direccion_z VARCHAR(30))
        BEGIN
        IF EXISTS  (SELECT 1 FROM zoologico WHERE id_zoologico = id_z) THEN
            UPDATE zoologico
            SET nombre = nombre_z, direccion=direccion_z
            WHERE id_zoologico = id_z;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error,el zoologico no se encuentra';
        END IF;
    END $$

    -- **-----------------
    -- Eliminar normal
    -- **-----------------

    CREATE PROCEDURE eliminar_zoologico(IN id_z INT)
        BEGIN 
        IF EXISTS(SELECT 1 FROM zoologico WHERE id_zoologico = id_z) THEN
            DELETE FROM zoologico WHERE id_zoologico=id_z;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: zoologico no encontrado';
        END IF;
    END $$


     -- **-----------------
    -- isnertar DEFINITIVO
    -- **-----------------
    CREATE PROCEDURE insertar_zoologico_def()
    BEGIN
        DECLARE zoologicoError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error al insertar';
        END;
        START TRANSACTION;
        CALL insert_zoologico('Zoologico Nacional', 'Av. Principal 123');
        CALL insert_zoologico('Safari Park', 'Carretera Norte Km 45');
        CALL insert_zoologico('Zoologico Urbano', 'Calle Central 567');
        CALL insert_zoologico('Reserva Fauna Silvestre', 'Ruta 33, Sector Sur');
        CALL insert_zoologico('Aventura Animal', 'Av. de la Libertad 789');

        SET zoologicoError = NULL;
        COMMIT;
    END $$

    -- **-----------------
    -- Modificar DEFINITIVO
    -- **-----------------
        CREATE PROCEDURE modificar_zoologico_def()
        BEGIN 
            DECLARE zoologicoError INT;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error, error al modificar';
            END;
            START TRANSACTION;
            CALL modificar_zoologico(1,'hello','calle 8');
            CALL modificar_zoologico(2,'cambio','carrera 9');

            SET zoologicoError= NULL;
            COMMIT;
        END $$

    -- **-----------------
    -- Eliminar DEFINITIVO
    -- **-----------------
    CREATE PROCEDURE eliminar_zoologico_def()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error al eliminar def';
        END;
        START TRANSACTION;
        CALL eliminar_zoologico(5);

        COMMIT;
    END $$

    -- **-----------------
    -- God zoologico
    -- **-----------------
    CREATE PROCEDURE zoologico_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en zoologico god';
        END;
        START TRANSACTION;
        CALL insertar_zoologico_def();
        CALL modificar_zoologico_def();
        CALL eliminar_zoologico_def();

        COMMIT;
    END $$


DELIMITER ;
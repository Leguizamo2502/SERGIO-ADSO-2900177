DELIMITER $$

    -- **-------------------
    -- Insertar en Autor
    -- **-------------------
    CREATE PROCEDURE insert_autor(IN nombre_a VARCHAR(50), IN apellido_a VARCHAR(50))
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM Autor WHERE nombre = nombre_a AND apellido = apellido_a) THEN
            INSERT INTO Autor (nombre, apellido)
            VALUES (nombre_a, apellido_a);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: El autor ya existe';
        END IF;
    END $$

    -- **-------------------
    -- Modificar en Autor
    -- **-------------------
    CREATE PROCEDURE modificar_autor(IN id_a INT, IN nombre_a VARCHAR(50), IN apellido_a VARCHAR(50))
    BEGIN
        IF EXISTS (SELECT 1 FROM Autor WHERE id_autor = id_a) THEN
            UPDATE Autor
            SET nombre = nombre_a, apellido = apellido_a
            WHERE id_autor = id_a;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Autor no encontrado';
        END IF;
    END $$

    -- **-------------------
    -- Eliminar en Autor
    -- **-------------------
    CREATE PROCEDURE eliminar_autor(IN id_a INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM Autor WHERE id_autor = id_a) THEN
            DELETE FROM Autor WHERE id_autor = id_a;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Autor no encontrado';
        END IF;
    END $$

    -- **--------------------
    -- insertar definitivo
    -- **--------------------
    CREATE PROCEDURE insert_autor_def()
    BEGIN
        DECLARE autorError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
         ROLLBACK;
         SELECT 'Error: Error al insertar Autor.';
        END;
        START TRANSACTION;
        CALL insert_autor('Gabriel', 'Garcia Marquez');
        CALL insert_autor('Isabel', 'Allende');
        CALL insert_autor('Mario', 'Vargas Llosa');
        CALL insert_autor('Jorge', 'Luis Borges');
        CALL insert_autor('Octavio', 'Paz');

        SET autorError= null;
        COMMIT;
    END $$


    -- **--------------------
    -- modificar definitivo
    -- **--------------------

    CREATE PROCEDURE modificar_autor_def()
    BEGIN 
        DECLARE autorError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
        ROLLBACK;
        SELECT 'Error: Error en modificar Autor.';
        END;
        START TRANSACTION;
        CALL modificar_autor(1,'Juan','Alimaña');
        CALL modificar_autor(2,'Joan','Shesppieer');

        SET autorError = null;
        COMMIT;
    END $$

    -- **--------------------
    -- ELIMINAR definitivo
    -- **--------------------
    CREATE PROCEDURE eliminar_autor_def()
    BEGIN 
        DECLARE autorError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
        ROLLBACK;
        SELECT 'Error: Error en eliminar Autor.';
        END;
        START TRANSACTION;
        CALL eliminar_autor(5);

        SET autorError = null;
        COMMIT;
    END $$



    -- **-----------------
    -- GOD AUTOR
    -- **-----------------
    CREATE PROCEDURE autor_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error: erroe en autor god';

        END;
        START TRANSACTION;

        CALL insert_autor_def();
        CALL modificar_autor_def();
        call eliminar_autor_def();

        COMMIT;
        SELECT 'Transaccion got autor exito' AS resultado;
    END $$

DELIMITER ;
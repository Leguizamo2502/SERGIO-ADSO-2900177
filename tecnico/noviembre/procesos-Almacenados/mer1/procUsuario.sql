
    DELIMITER $$
    -- **--------------
    -- Insetar normal
    -- **--------------
    CREATE PROCEDURE insert_usuario(IN nombre_u VARCHAR(50), IN correo_u VARCHAR(80), IN clave_u varchar(50))
        BEGIN
            IF NOT EXISTS (SELECT 1  FROM Usuario WHERE nombre = nombre_u AND correo = correo_u AND clave = clave_u) THEN
                INSERT INTO Usuario (nombre,correo,clave)
                VALUES (nombre_u,correo_u,clave_u); 
            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Error: EL usuario ya existe';
            END IF;
        END $$


    -- **-----------------
    -- Modificar normal
    -- **-----------------
    CREATE PROCEDURE modificar_usuario(
        IN id_u INT,
        IN nombre_u VARCHAR(50),
        IN correo_u VARCHAR(80),
        IN clave_u VARCHAR(50)
    )
    BEGIN
        IF EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = id_u) THEN
            UPDATE Usuario
            SET nombre = nombre_u, correo = correo_u, clave = clave_u
            WHERE id_usuario = id_u;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Usuario no encontrado';
        END IF;
    END $$

    -- **--------------
    -- borrar normal
    -- **--------------
    CREATE PROCEDURE eliminar_usuario(IN id_u INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = id_u) THEN
            DELETE FROM Usuario WHERE id_usuario = id_u;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Usuario no encontrado';
        END IF;
    END $$







    -- **--------------------
    -- insertar definitivo
    -- **--------------------
    CREATE PROCEDURE insert_usuario_def()
    BEGIN
        DECLARE usuarioError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error: Error al insertar usuario.';
        END;
        START TRANSACTION;

        CALL insert_usuario('Juan Pérez', 'juan.perez@example.com', 'clave123');
        CALL insert_usuario('Ana García', 'ana.garcia@example.com', 'clave456');
        CALL insert_usuario('Carlos López', 'carlos.lopez@example.com', 'clave789');
        CALL insert_usuario('Laura Rodríguez', 'laura.rodriguez@example.com', 'clave101');
        CALL insert_usuario('Pedro Sánchez', 'pedro.sanchez@example.com', 'clave202');

        SET usuarioError = NULL;
        COMMIT;
    END $$


    -- **--------------------
    -- modificar definitivo
    -- **--------------------
    CREATE PROCEDURE modificar_usuario_def()
    BEGIN
        DECLARE usuarioError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error: Error al modificar usuario.';
        END;
        START TRANSACTION;

        CALL modificar_usuario(1,'sergio', 'sergio.perez@example.com', 'clave123');
        CALL modificar_usuario(2,'Andres', 'ana.garcia@example.com', 'clave456');
        
        SET usuarioError = NULL;
        COMMIT;
    END $$


-- **-------------------------
    -- ELIMINAR DEFINITIVO
-- **-------------------------
    CREATE PROCEDURE eliminar_usuario_def()
    BEGIN
        DECLARE usuarioError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error: Error al eliminar usuario.';
        END;
        START TRANSACTION;

        CALL eliminar_usuario(5);
        
        SET usuarioError = NULL;
        COMMIT;
    END $$




    -- **---------------
    -- god usuario
    -- **---------------

    -- **---------------
    -- god usuario
    -- **---------------

    CREATE PROCEDURE usuario_god()
    BEGIN 
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
		ROLLBACK;
            SELECT 'Error: erroe en USUARIO god';

        END;
        START TRANSACTION;

        CALL insert_usuario_def();
        CALL modificar_usuario_def();
        call eliminar_usuario_def();

        COMMIT;
        SELECT 'Transaccion got usuario exito' AS resultado;
    END $$
    




DELIMITER ;
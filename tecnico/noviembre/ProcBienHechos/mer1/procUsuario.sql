SET @id_u = 5, @nombre_u = 'Lolita', @correo_u= 'lola@gamil.com', @clave_u = 'lola123';
DELIMITER $$
    CREATE PROCEDURE proc_usuario()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Usuario WHERE nombre = @nombre_u AND correo = @correo_u) > 0 THEN -- Insertar
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe';
                    ELSE
                        INSERT INTO Usuario VALUES (1,'Sergio','sergio@gmail.com','clave123'),(2, 'María', 'maria@hotmail.com', 'pass456'),(3, 'Luis', 'luis@yahoo.com', 'clave789'),(4, 'Ana', 'ana@gmail.com', '1234abcd'),(@id_u,@nombre_u,@correo_u,@clave_u);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Usuario WHERE id_usuario = @id_u) THEN -- Actualizar y borrar
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL usuario no existe';
                    ELSE
                        UPDATE Usuario SET nombre = 'Sofia', correo = 'sofia@hotmail.com', clave = 'secure789' WHERE id_usuario = 1;
                        UPDATE Usuario SET nombre = 'Pedro', correo = 'pedro@yahoo.com', clave = 'mypassword' WHERE id_usuario = 2;
                        DELETE FROM Usuario WHERE id_usuario = @id_u;
                END IF;
            COMMIT;
        END $$
DELIMITER ;
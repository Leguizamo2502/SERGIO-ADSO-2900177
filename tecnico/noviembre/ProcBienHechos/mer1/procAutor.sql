SET @id_a = 6, @nombre_a = 'No C', @apellido_a = 'Menos';
DELIMITER $$
    CREATE PROCEDURE proc_autor()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Autor WHERE nombre = @nombre_a AND apellido = @apellido_a)>0 THEN -- Insertar
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El autor ya existe';
                    ELSE
                        INSERT INTO Autor VALUES (1,'Gabriel','Marquez'),(2, 'Jorge', 'Borges'),(3, 'Isabel', 'Allende'),(4, 'Mario', 'Vargas Llosa'),(5, 'Gabriel', 'García Márquez'),(@id_a,@nombre_a,@apellido_a);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Autor WHERE nombre= @nombre_a AND apellido = @apellido_a) THEN -- Modificar y borrar
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El Autor no existe';
                    ELSE
                        UPDATE Autor SET nombre ='Jane', apellido = 'Austen' WHERE id_autor = 1;
                        UPDATE Autor SET nombre = 'Mark', apellido = 'Twain' WHERE id_autor = 2;
                        DELETE FROM Autor WHERE id_autor = @id_a;
                END IF;
            COMMIT;
        END $$
DELIMITER ;
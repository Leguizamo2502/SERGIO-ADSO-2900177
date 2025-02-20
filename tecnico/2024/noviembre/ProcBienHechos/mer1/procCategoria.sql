SET @id_c = 6, @nombre_c = 'Ciencia Ficción';
DELIMITER $$
    CREATE PROCEDURE proc_categoria()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Categoria WHERE nombre = @nombre_c) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoría ya existe';
                ELSE
                    INSERT INTO Categoria VALUES (1, 'Novela'),(2, 'Poesía'),(3, 'Ensayo'),(4, 'Biografía'),(5,'Fantasia'),(@id_c, @nombre_c);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Categoria WHERE id_categoria = @id_c) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoría no existe';
                ELSE
                    UPDATE Categoria SET nombre = 'Drama' WHERE id_categoria = 1;
                    UPDATE Categoria SET nombre = 'Fantasía' WHERE id_categoria = 2;
                    DELETE FROM Categoria WHERE id_categoria = @id_c;
                END IF;
            COMMIT;
        END $$
DELIMITER ;
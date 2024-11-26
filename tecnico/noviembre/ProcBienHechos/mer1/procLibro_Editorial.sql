SET @id_le = 5, @id_libro_le = 3, @id_editorial_le = 2;
DELIMITER $$
    CREATE PROCEDURE proc_libro_editorial()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Libro_Editorial WHERE id_libro = @id_libro_le AND id_editorial = @id_editorial_le) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-editorial ya existe';
                ELSE
                    INSERT INTO Libro_Editorial VALUES (1, 1, 1),(2, 2, 1),(3, 3, 2),(4, 4, 3),(@id_le, @id_libro_le, @id_editorial_le);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Libro_Editorial WHERE id_libro_editorial = @id_le) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-editorial no existe';
                ELSE
                    UPDATE Libro_Editorial SET id_libro = 4, id_editorial = 1 WHERE id_libro_editorial = 1;
                    UPDATE Libro_Editorial SET id_libro = 2, id_editorial = 3 WHERE id_libro_editorial = 2;
                    DELETE FROM Libro_Editorial WHERE id_libro_editorial = @id_le;
                END IF;
            COMMIT;
        END $$
DELIMITER ;

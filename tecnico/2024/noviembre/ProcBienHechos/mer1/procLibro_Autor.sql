SET @id_la = 5, @id_libro_la = 3, @id_autor_la = 2;
DELIMITER $$
CREATE PROCEDURE proc_libro_autor()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END;
        START TRANSACTION;
            IF (SELECT COUNT(*) FROM Libro_Autor WHERE id_libro = @id_libro_la AND id_autor = @id_autor_la) > 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-autor ya existe';
            ELSE
                INSERT INTO Libro_Autor VALUES (1, 1, 1),(2, 2, 2),(3, 3, 3),(4, 4, 4),(@id_la, @id_libro_la, @id_autor_la);
            END IF;
            IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE id_libro_autor = @id_la) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-autor no existe';
            ELSE
                UPDATE Libro_Autor SET id_libro = 1, id_autor = 2 WHERE id_libro_autor = 1;
                UPDATE Libro_Autor SET id_libro = 2, id_autor = 4 WHERE id_libro_autor = 2;
                DELETE FROM Libro_Autor WHERE id_libro_autor = @id_la;
            END IF;
        COMMIT;
    END $$
DELIMITER ;

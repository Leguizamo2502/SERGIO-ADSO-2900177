SET @id_lc = 5, @id_libro_lc = 2, @id_categoria_lc = 4;
DELIMITER $$
    CREATE PROCEDURE proc_libro_categoria()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Libro_Categoria WHERE id_libro = @id_libro_lc AND id_categoria = @id_categoria_lc) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-categoría ya existe';
                ELSE
                    INSERT INTO Libro_Categoria VALUES (1, 1, 1),(2, 2, 2),(3, 3, 3),(4, 4, 4),(@id_lc, @id_libro_lc, @id_categoria_lc);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Libro_Categoria WHERE id_libro_categoria = @id_lc) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La relación libro-categoría no existe';
                ELSE
                    UPDATE Libro_Categoria SET id_libro = 1, id_categoria = 4 WHERE id_libro_categoria = 1;
                    UPDATE Libro_Categoria SET id_libro = 2, id_categoria = 3 WHERE id_libro_categoria = 2;
                    DELETE FROM Libro_Categoria WHERE id_libro_categoria = @id_lc;
                END IF;
            COMMIT;
        END $$
DELIMITER ;
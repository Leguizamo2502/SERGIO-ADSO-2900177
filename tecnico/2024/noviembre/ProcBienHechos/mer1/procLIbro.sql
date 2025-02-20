SET @id_l = 6, @titulo_l = 'Cien años de soledad';
DELIMITER $$
    CREATE PROCEDURE proc_libro()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Libro WHERE titulo = @titulo_l) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro ya existe';
                ELSE
                    INSERT INTO Libro VALUES (1, 'La Casa de los Espíritus'),(2, 'Rayuela'),(3, 'El Aleph'),(4, 'Pantaleón y las visitadoras'),(5, 'Metamorfosis'),(@id_l, @titulo_l);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Libro WHERE id_libro = @id_l) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro no existe';
                ELSE
                    UPDATE Libro SET titulo = 'Don Quijote de la Mancha' WHERE id_libro = 1;
                    UPDATE Libro SET titulo = 'El principito' WHERE id_libro = 2;
                    DELETE FROM Libro WHERE id_libro = @id_l;
                END IF;
            COMMIT;
        END $$
DELIMITER ;
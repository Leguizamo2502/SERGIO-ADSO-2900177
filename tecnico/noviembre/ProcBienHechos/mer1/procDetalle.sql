SET @id_d = 3, @cant_d = 2, @id_l_d = 3, @id_p_d = 2;
DELIMITER $$
    CREATE PROCEDURE proc_detalle()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Detalle WHERE id_libro = @id_l_d AND id_prestamo = @id_p_d) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El detalle ya existe';
                ELSE
                    INSERT INTO Detalle VALUES (1, 1, 1, 1),(2, 2, 2, 2),(@id_d, @cant_d, @id_l_d, @id_p_d);
                END IF;
                IF NOT EXISTS (SELECT 1 FROM Detalle WHERE id_prestamo = @id_p_d AND id_libro = @id_l_d) THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El detalle no existe';
                ELSE
                    UPDATE Detalle SET cantidad = 5 WHERE id_detalle = 1;
                    UPDATE Detalle SET cantidad = 3 WHERE id_detalle = 2;
                    DELETE FROM Detalle WHERE id_detalle = @id_d;
                END IF;
            COMMIT;
        END $$
DELIMITER ;

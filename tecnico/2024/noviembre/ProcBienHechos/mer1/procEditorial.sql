SET @id_e = 6, @nombre_e = 'Planeta';
DELIMITER $$
    CREATE PROCEDURE proc_editorial()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
            END;
            START TRANSACTION;
                IF (SELECT COUNT(*) FROM Editorial WHERE nombre = @nombre_e) > 0 THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La editorial ya existe';
                    ELSE
                        INSERT INTO Editorial VALUES (1, 'Santillana'),(2, 'Alfaguara'),(3, 'Anagrama'),(4, 'Penguin Random House'),(5, 'Waos'),(@id_e, @nombre_e);
                    END IF;
                    IF NOT EXISTS (SELECT 1 FROM Editorial WHERE id_editorial = @id_e) THEN
                      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La editorial no existe';
                        ELSE
                            UPDATE Editorial SET nombre = 'Tusquets' WHERE id_editorial = 1;
                            UPDATE Editorial SET nombre = 'RBA' WHERE id_editorial = 2;
                            DELETE FROM Editorial WHERE id_editorial = @id_e;
                    END IF;
                COMMIT;
            END $$
DELIMITER ;
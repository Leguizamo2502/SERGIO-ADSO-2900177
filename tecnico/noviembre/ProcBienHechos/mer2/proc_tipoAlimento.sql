DELIMITER $$
CREATE PROCEDURE proc_tipoAlimento(IN id_ta INT, IN nombre_ta VARCHAR(30))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM tipoAlimento WHERE nombre = nombre_ta)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El tipo de alimento ya existe';
        ELSE
            INSERT INTO tipoAlimento VALUES (1, 'carne'),(2, 'fruta'),(3, 'vegetales'),(4, 'pescado'),(id_ta, nombre_ta);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM tipoAlimento WHERE id_tipoAlimento = id_ta) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de alimento a modificar no existe';
        ELSE
            UPDATE tipoAlimento SET nombre = 'alimento especial' WHERE id_tipoAlimento = 1;
            UPDATE tipoAlimento SET nombre = 'golosinas' WHERE id_tipoAlimento = 2;
            DELETE FROM tipoAlimento WHERE id_tipoAlimento = id_ta;
        END IF;
    COMMIT;
END $$
DELIMITER ;
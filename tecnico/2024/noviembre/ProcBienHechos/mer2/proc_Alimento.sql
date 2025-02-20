DELIMITER $$
CREATE PROCEDURE proc_alimentos(IN id_a INT, IN nombre_a VARCHAR(30), IN cantidad_a INT, IN id_ta INT, IN id_z INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM alimentos WHERE nombre = nombre_a AND id_tipoAlimento = id_ta AND id_zoologico = id_z)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El alimento ya existe';
        ELSE
            INSERT INTO alimentos VALUES (1, 'carne de res', 50, 1, 1),(2, 'manzanas', 30, 2, 2),(3, 'zanahorias', 25, 3, 3),(4, 'pescado', 20, 4, 4),(id_a, nombre_a, cantidad_a, id_ta, id_z);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM alimentos WHERE id_alimento = id_a) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El alimento a modificar no existe';
        ELSE
            UPDATE alimentos SET nombre = 'carne de pollo', cantidad = 60 WHERE id_alimento = 1;
            UPDATE alimentos SET nombre = 'peras', cantidad = 40 WHERE id_alimento = 2;
            DELETE FROM alimentos WHERE id_alimento = id_a;
        END IF;
    COMMIT;
END $$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE proc_animales_alimentos(IN id_aa INT, IN cantidad_d INT, IN id_a INT, IN id_al INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM animales_alimentos WHERE id_animal = id_a AND id_alimento = id_al)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El registro ya existe en animales_alimentos';
        ELSE
            INSERT INTO animales_alimentos VALUES (1, 5, 1, 1),(2, 10, 2, 2),(3, 12, 2, 1),(4, 13, 3, 1),(id_aa, cantidad_d, id_a, id_al);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM animales_alimentos WHERE id_animales_alimentos = id_aa) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro a modificar no existe';
        ELSE
            UPDATE animales_alimentos SET cantidad_dia = 7 WHERE id_animales_alimentos = 1;
            UPDATE animales_alimentos SET cantidad_dia = 8 WHERE id_animales_alimentos = 2;
            DELETE FROM animales_alimentos WHERE id_animales_alimentos = id_aa;
        END IF;
    COMMIT;
END $$
DELIMITER ;

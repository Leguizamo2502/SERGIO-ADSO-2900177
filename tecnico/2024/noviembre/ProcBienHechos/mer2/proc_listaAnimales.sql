DELIMITER $$
CREATE PROCEDURE proc_listaAnimales(IN id_l INT, IN id_z INT, IN id_a INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM listaAnimales WHERE id_zoologico = id_z AND id_animal = id_a)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La lista de animales ya contiene este registro';
        ELSE
            INSERT INTO listaAnimales VALUES (1, 1, 1),(2, 1, 2),(3, 2, 3),(4, 3 ,1),(id_l, id_z, id_a);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM listaAnimales WHERE id_listaAnimales = id_l) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La lista a modificar no existe';
        ELSE
            UPDATE listaAnimales SET id_zoologico = 2, id_animal = 3 WHERE id_listaAnimales = 1;
            UPDATE listaAnimales SET id_zoologico = 3, id_animal = 2 WHERE id_listaAnimales = 2;
            DELETE FROM listaAnimales WHERE id_listaAnimales = id_l;
        END IF;
    COMMIT;
END $$
DELIMITER ;

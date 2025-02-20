DELIMITER $$
CREATE PROCEDURE proc_animales(IN id_a INT, IN nombre_a VARCHAR(30), IN genero_a VARCHAR(30), IN id_e INT, IN id_h INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM animales WHERE nombre = nombre_a AND id_especie = id_e AND id_habitat = id_h)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El animal ya existe';
        ELSE
            INSERT INTO animales VALUES (1, 'Simba', 'Macho', 1, 1),(2, 'Nala', 'Hembra', 1, 1),(3, 'Tigrillo', 'Macho', 2, 2),(4, 'Lola','Hembra',3,3),(id_a, nombre_a, genero_a, id_e, id_h);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM animales WHERE id_animal = id_a AND nombre = nombre_a AND id_especie = id_e AND id_habitat = id_h) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El animal a modificar no existe';
        ELSE
            UPDATE animales SET nombre = 'Kimba', genero = 'Macho' WHERE id_animal = 1;
            UPDATE animales SET nombre = 'Tigrillo', genero = 'Hembra' WHERE id_animal = 2;
            DELETE FROM animales WHERE id_animal = id_a;
        END IF;
    COMMIT;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE proc_habitat(IN id_h INT, IN nombre_h VARCHAR(30), IN tipo_h VARCHAR(30), IN capacidad_h INT, IN id_z INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM habitat WHERE nombre = nombre_h AND tipo = tipo_h AND id_zoologico = id_z)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El hábitat ya existe';
        ELSE
            INSERT INTO habitat VALUES (1, 'sabana africana', 'desértico', 20, 1),(2, 'selva amazónica', 'tropical', 15, 2),(3, 'pantano', 'húmedo', 10, 3),(4, 'gran arrecife', 'acuático', 25, 4),(5, 'isla tropical', 'terrestre', 18, 3),(id_h, nombre_h, tipo_h, capacidad_h, id_z);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM habitat WHERE id_habitat = id_h) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El hábitat a modificar no existe';
        ELSE
            UPDATE habitat SET nombre = 'zona desértica', tipo = 'árido', capacidad = 18 WHERE id_habitat = 1;
            UPDATE habitat SET nombre = 'selva del pacífico', tipo = 'húmedo', capacidad = 12 WHERE id_habitat = 2;
            DELETE FROM habitat WHERE id_habitat = id_h;
        END IF;
    COMMIT;
END $$
DELIMITER ;
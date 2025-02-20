DELIMITER $$
CREATE PROCEDURE proc_zoologico(IN id_z INT, IN nombre_z VARCHAR(30), IN direccion_z VARCHAR(30))
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END;
        START TRANSACTION;
            IF (SELECT COUNT(*) FROM zoologico WHERE nombre = nombre_z AND direccion = direccion_z)>0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='el zoologico ya existe';
            ELSE
                INSERT INTO zoologico VALUES (1,'zoologico central','calle 8 #4-45'),(2, 'parque natural norte', 'avenida 15 #10-20'),  (3, 'safari del sur', 'calle 3 #8-30'),  (4, 'reserva bosque verde', 'vereda el roble km 5'),  (5, 'acuaparque del oeste', 'carrera 22 #15-10'),  (6, 'jardín zoológico pacífico', 'carrera 12 #30-25'),(id_z,nombre_z,direccion_z);
            END IF;
            IF NOT EXISTS (SELECT 1 FROM zoologico WHERE nombre = nombre_z AND direccion = direccion_z) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El zoologico a modificar no existe';
            ELSE
                UPDATE zoologico SET nombre = 'fauna silvestre', direccion = 'calle 25 #12-34' WHERE id_zoologico = 1;
                UPDATE zoologico SET nombre = 'parque de conservación', direccion = 'avenida 8 #4-12' WHERE id_zoologico = 2;
                DELETE FROM zoologico WHERE id_zoologico = id_z;
            END IF;
        COMMIT;
    END $$
DELIMITER ;
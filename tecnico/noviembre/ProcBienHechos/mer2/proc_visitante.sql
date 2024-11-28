DELIMITER $$
CREATE PROCEDURE proc_visitante(IN id_v INT, IN nombre_v VARCHAR(30), IN fecha_v DATE, IN id_z INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM visitante WHERE nombre = nombre_v AND fecha_visita = fecha_v AND id_zoologico = id_z)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El visitante ya está registrado';
        ELSE
            INSERT INTO visitante VALUES (1, 'Carlos', '2024-11-01', 1),(2, 'Ana', '2024-11-02', 2),(3, 'José', '2024-11-03', 3),(4, 'Marta', '2024-11-04', 4),(id_v, nombre_v, fecha_v, id_z);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM visitante WHERE id_visitante = id_v) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El visitante a modificar no existe';
        ELSE
            UPDATE visitante SET nombre = 'Carlos Andrés', fecha_visita = '2024-11-05' WHERE id_visitante = 1;
            UPDATE visitante SET nombre = 'Ana María', fecha_visita = '2024-11-06' WHERE id_visitante = 2;
            DELETE FROM visitante WHERE id_visitante = id_v;
        END IF;
    COMMIT;
END $$
DELIMITER ;
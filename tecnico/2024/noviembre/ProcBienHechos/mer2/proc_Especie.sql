DELIMITER $$
CREATE PROCEDURE proc_especie(IN id_e INT, IN nombre_e VARCHAR(30))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
        IF (SELECT COUNT(*) FROM especie WHERE nombre = nombre_e)>0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La especie ya existe';
        ELSE
            INSERT INTO especie VALUES (1, 'león'),(2, 'tigre'),(3, 'oso panda'),(4, 'águila calva'),(5,'cerdo'),(id_e, nombre_e);
        END IF;
        IF NOT EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La especie a modificar no existe';
        ELSE
            UPDATE especie SET nombre = 'jaguar' WHERE id_especie = 1;
            UPDATE especie SET nombre = 'pantera negra' WHERE id_especie = 2;
            DELETE FROM especie WHERE id_especie = id_e;
        END IF;
    COMMIT;
END $$
DELIMITER ;


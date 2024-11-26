SET @id_p = 4, @fecha_p = '2024-11-01', @fecha_d = '2024-11-15', @id_u_p = 3;
DELIMITER $$
CREATE PROCEDURE proc_prestamo()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
        END;
        START TRANSACTION;
            IF (SELECT COUNT(*) FROM Prestamo WHERE id_usuario = @id_u_p AND fecha_prestamo = @fecha_p) > 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El préstamo ya existe';
            ELSE
                INSERT INTO Prestamo VALUES (1, '2024-10-01', '2024-10-10', 1),(2, '2024-10-05', '2024-10-20', 2),(3, '2024-10-15', '2024-10-25', 3),(@id_p, @fecha_p, @fecha_d, @id_u_p);
            END IF;
            IF NOT EXISTS (SELECT 1 FROM Prestamo WHERE id_prestamo = @id_p) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El préstamo no existe';
            ELSE
                UPDATE Prestamo SET fecha_prestamo = '2024-11-10', fecha_devolucion = '2024-11-20' WHERE id_prestamo = 1;
                UPDATE Prestamo SET fecha_prestamo = '2024-11-15', fecha_devolucion = '2024-12-01' WHERE id_prestamo = 2;
                DELETE FROM Prestamo WHERE id_prestamo = @id_p;
            END IF;
        COMMIT;
    END $$
DELIMITER ;
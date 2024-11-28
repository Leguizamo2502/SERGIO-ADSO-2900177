DELIMITER $$
CREATE PROCEDURE procedimiento_todo_poderoso()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error: Ha ocurrido un problema con las transacciones.' AS resultado;
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro' AS resultado;
        END;
        CALL proc_libro();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en categoria' AS resultado;
        END;
        CALL proc_categoria();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en usuario' AS resultado;
        END;
        CALL proc_usuario();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en autor' AS resultado;
        END;
        CALL proc_autor();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en editorial' AS resultado;
        END;
        CALL proc_editorial();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en prestamo' AS resultado;
        END;
        CALL proc_prestamo();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en detalle' AS resultado;
        END;
        CALL proc_detalle();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_categoria' AS resultado;
        END;
        CALL proc_libro_categoria();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_autor' AS resultado;
        END;
        CALL proc_libro_autor();
    END;
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_editorial' AS resultado;
        END;
        CALL proc_libro_editorial();
    END;
    SELECT 'Transacción de todo poderoso completada con éxito' AS resultado;
    SELECT * FROM Usuario;
    SELECT * FROM Autor;
    SELECT * FROM Editorial;
    SELECT * FROM Categoria;
    SELECT * FROM Prestamo;
    SELECT * FROM Detalle;
    SELECT * FROM Libro;
END $$
DELIMITER ;
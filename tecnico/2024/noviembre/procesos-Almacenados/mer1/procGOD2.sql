DELIMITER $$

CREATE PROCEDURE procedimiento_todo_poderoso()
BEGIN
    -- Declarar un manejador general para errores de la transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        SELECT 'Error: Ha ocurrido un problema con las transacciones.' AS resultado;
    END;


    -- Llamadas a los procesos con manejadores específicos
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro god' AS resultado;
        END;
        CALL libro_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en categoria god' AS resultado;
        END;
        CALL categoria_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en usuario god' AS resultado;
        END;
        CALL usuario_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en autor god' AS resultado;
        END;
        CALL autor_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en editorial god' AS resultado;
        END;
        CALL editorial_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en prestamo god' AS resultado;
        END;
        CALL prestamo_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en detalle god' AS resultado;
        END;
        CALL detalle_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_categoria god' AS resultado;
        END;
        CALL libro_categoria_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_autor god' AS resultado;
        END;
        CALL libro_autor_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en libro_editorial god' AS resultado;
        END;
        CALL libro_editorial_god();
    END;



    -- Mensaje de éxito
    SELECT 'Transacción de todo poderoso completada con éxito' AS resultado;

    -- Mostrar tablas relevantes
    SELECT * FROM Usuario;
    SELECT * FROM Autor;
    SELECT * FROM Editorial;
    SELECT * FROM Categoria;
    SELECT * FROM Prestamo;
    SELECT * FROM Detalle;
    SELECT * FROM Libro;
    SELECT * FROM Libro_Editorial;
    SELECT * FROM Libro_Categoria;
    SELECT * FROM Libro_Autor;

END $$

DELIMITER ;

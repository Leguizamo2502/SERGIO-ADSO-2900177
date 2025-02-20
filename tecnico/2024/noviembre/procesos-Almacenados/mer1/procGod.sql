DELIMITER $$

    CREATE PROCEDURE procedimiento_todo_poderoso()
            BEGIN
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                BEGIN
                    ROLLBACK;
                    SELECT 'Error: Ha ocurrido un problema con las transacciones.' AS resultado;
                END;

                START TRANSACTION;

                    CALL libro_god();
                    CALL categoria_god();
                    CALL usuario_god();
                    CALL autor_god();
                    CALL editorial_god();
                    CALL prestamo_god();
                    CALL detalle_god();
                    CALL libro_categoria_god();
                    CALL libro_autor_god();
                    CALL libro_editorial_god();
                    
                    

                COMMIT;

                SELECT 'Transacción de todo poderoso completada con éxito' AS resultado;
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
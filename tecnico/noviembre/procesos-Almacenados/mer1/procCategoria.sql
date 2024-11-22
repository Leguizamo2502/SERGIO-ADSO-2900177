DELIMITER $$

-- **--------------
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_categoria(IN nombre_c VARCHAR(50))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Categoria WHERE nombre = nombre_c) THEN
        INSERT INTO Categoria (nombre)
        VALUES (nombre_c);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La categoría ya existe';
    END IF;
END $$

-- **-----------------
-- Modificar normal
-- **-----------------
CREATE PROCEDURE modificar_categoria(
    IN id_c INT,
    IN nombre_c VARCHAR(50)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Categoria WHERE id_categoria = id_c) THEN
        UPDATE Categoria
        SET nombre = nombre_c
        WHERE id_categoria = id_c;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Categoría no encontrada';
    END IF;
END $$

-- **--------------
-- Borrar normal
-- **--------------
CREATE PROCEDURE eliminar_categoria(IN id_c INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Categoria WHERE id_categoria = id_c) THEN
        DELETE FROM Categoria WHERE id_categoria = id_c;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Categoría no encontrada';
    END IF;
END $$

-- **--------------------
-- Insertar definitivo
-- **--------------------
CREATE PROCEDURE insert_categoria_def()
BEGIN
    DECLARE categoriaError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al insertar categoría.';
    END;
    START TRANSACTION;

    CALL insert_categoria('Novela');
    CALL insert_categoria('Poesía');
    CALL insert_categoria('Historia');
    CALL insert_categoria('Ciencia Ficción');
    CALL insert_categoria('Biografía');
    CALL insert_categoria('Aventura');
    CALL insert_categoria('Drama');

    SET categoriaError = NULL;
    COMMIT;
END $$

-- **--------------------
-- Modificar definitivo
-- **--------------------
CREATE PROCEDURE modificar_categoria_def()
BEGIN
    DECLARE categoriaError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al modificar categoría.';
    END;
    START TRANSACTION;

    CALL modificar_categoria(1, 'Psicologia');
    CALL modificar_categoria(2, 'Fantasia');
    
    SET categoriaError = NULL;
    COMMIT;
END $$

-- **-------------------------
-- Eliminar definitivo
-- **-------------------------
CREATE PROCEDURE eliminar_categoria_def()
BEGIN
    DECLARE categoriaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al eliminar categoría.';
    END;
    START TRANSACTION;

    CALL eliminar_categoria(7);
    
    SET categoriaError = NULL;
    COMMIT;
END $$

-- **---------------
-- God categoria
-- **---------------
CREATE PROCEDURE categoria_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en las transacciones god categoría';
    END;

    START TRANSACTION;
    CALL insert_categoria_def();
    CALL modificar_categoria_def();
    CALL eliminar_categoria_def();

    COMMIT;
    SELECT 'Transacción de categoría god completada' AS resultado;
END $$

DELIMITER ;
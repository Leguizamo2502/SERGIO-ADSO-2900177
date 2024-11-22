DELIMITER $$

-- **--------------
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_libro(IN titulo_l VARCHAR(100))
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Libro WHERE titulo = titulo_l) THEN
        INSERT INTO Libro (titulo)
        VALUES (titulo_l);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El libro ya existe';
    END IF;
END $$

-- **-----------------
-- Modificar normal
-- **-----------------
CREATE PROCEDURE modificar_libro(
    IN id_l INT,
    IN titulo_l VARCHAR(100)
)
BEGIN
    IF EXISTS (SELECT 1 FROM Libro WHERE id_libro = id_l) THEN
        UPDATE Libro
        SET titulo = titulo_l
        WHERE id_libro = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Libro no encontrado';
    END IF;
END $$

-- **--------------
-- Borrar normal
-- **--------------
CREATE PROCEDURE eliminar_libro(IN id_l INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Libro WHERE id_libro = id_l) THEN
        DELETE FROM Libro WHERE id_libro = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Libro no encontrado';
    END IF;
END $$

-- **--------------------
-- Insertar definitivo
-- **--------------------
CREATE PROCEDURE insert_libro_def()
BEGIN
    DECLARE libroError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al insertar libro.';
    END;
    START TRANSACTION;

    CALL insert_libro('Cien años de soledad');
    CALL insert_libro('La casa de los espíritus');
    CALL insert_libro('La ciudad y los perros');
    CALL insert_libro('Rayuela');
    CALL insert_libro('Veinte poemas de amor');
    CALL insert_libro('El Principito');
    CALL insert_libro('Metamorfosis');
    CALL insert_libro('1984');
    CALL insert_libro('Don Quijote de la Mancha');
    CALL insert_libro('Matar a un ruiseñor');
    CALL insert_libro('El Gran Gatsby');

    SET libroError = NULL;
    COMMIT;
END $$

-- **--------------------
-- Modificar definitivo
-- **--------------------
CREATE PROCEDURE modificar_libro_def()
BEGIN
    DECLARE libroError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al modificar libro.';
    END;
    START TRANSACTION;

    CALL modificar_libro(1, 'Cien años de soledad - Edición Conmemorativa');
    CALL modificar_libro(2, 'La casa de los espíritus - Edición Especial');
    
    SET libroError = NULL;
    COMMIT;
END $$

-- **-------------------------
-- Eliminar definitivo
-- **-------------------------
CREATE PROCEDURE eliminar_libro_def()
BEGIN
    DECLARE libroError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Error al eliminar libro.';
    END;
    START TRANSACTION;

    CALL eliminar_libro(11);
    
    SET libroError = NULL;
    COMMIT;
END $$

-- **---------------
-- God libro
-- **---------------
CREATE PROCEDURE libro_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en las transacciones god libro';
    END;

    START TRANSACTION;
    CALL insert_libro_def();
    CALL modificar_libro_def();
    CALL eliminar_libro_def();

    COMMIT;
    SELECT 'Transacción de libro god completada' AS resultado;
    SELECT * FROM libro;
END $$

DELIMITER ;
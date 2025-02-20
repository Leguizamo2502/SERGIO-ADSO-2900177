DELIMITER $$

-- **--------------
-- INSERTAR NORMAL PARA Libro_Autor
-- **-------------
CREATE PROCEDURE insert_libro_autor(IN id_libro_la INT, IN id_autor_la INT)
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE id_libro = id_libro_la OR id_autor = id_autor_la) THEN
        INSERT INTO Libro_Autor (id_libro, id_autor)
        VALUES (id_libro_la, id_autor_la);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-autor ya existe';
    END IF;
END $$

-- **--------------
-- Modificar NORMAL PARA Libro_Autor
-- **-------------
CREATE PROCEDURE modificar_libro_autor(IN id_libro_la INT, IN id_autor_la INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE id_libro = id_libro_la AND id_autor = id_autor_la) THEN
        UPDATE Libro_Autor
        SET id_libro = id_libro_la,
            id_autor = id_autor_la
        WHERE id_libro = id_libro_la AND id_autor = id_autor_la;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-autor no existe';
    END IF;
END $$

-- **--------------
-- Eliminar NORMAL PARA Libro_Autor
-- **-------------
CREATE PROCEDURE eliminar_libro_autor(IN id_libro_autor_la INT)
BEGIN
    IF EXISTS (SELECT 1 FROM Libro_Autor WHERE id_libro_autor = id_libro_autor_la) THEN
        DELETE FROM Libro_Autor WHERE id_libro_autor = id_libro_autor_la;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La relación libro-autor no existe';
    END IF;
END $$

-- **----------------
-- INSERTAR DEFINITIVO PARA Libro_Autor
-- **----------------
CREATE PROCEDURE insert_libro_autor_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en insertar libro-autor';
    END;
    START TRANSACTION;
    CALL insert_libro_autor(1,1);
    CALL insert_libro_autor(2,2);
    CALL insert_libro_autor(3,3);
    CALL insert_libro_autor(4,4);

    COMMIT;
END $$

-- **----------------
-- Modificar DEFINITIVO PARA Libro_Autor
-- **----------------
CREATE PROCEDURE modificar_libro_autor_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en modificar libro-autor';
    END;
    START TRANSACTION;
    CALL modificar_libro_autor(1, 2);
    CALL modificar_libro_autor(2, 3);

    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO PARA Libro_Autor
-- **----------------
CREATE PROCEDURE eliminar_libro_autor_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en eliminar libro-autor';
    END;
    START TRANSACTION;
    CALL eliminar_libro_autor(3);

    COMMIT;
END $$

-- **----------------
-- Libro_Autor God
-- **----------------
CREATE PROCEDURE Libro_Autor_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error, error en libro-autor god';
    END;
    START TRANSACTION;
    CALL insert_libro_autor_def();
    CALL modificar_libro_autor_def();
    CALL eliminar_libro_autor_def();

    COMMIT;
END $$

-- Repetir para otras tablas pivote como Libro_Genero, Libro_Idioma, etc.

DELIMITER ;

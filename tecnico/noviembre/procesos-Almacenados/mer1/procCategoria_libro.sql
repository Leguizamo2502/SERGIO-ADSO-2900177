DELIMITER $$
    -- **--------------
    -- INSERTAR NORMAL
    -- **-------------
    CREATE PROCEDURE insert_libro_categoria(IN id_libro_lc INT, IN id_categoria_lc INT)
    BEGIN 
        IF NOT EXISTS (SELECT 1 FROM Libro_Categoria WHERE id_libro = id_libro_lc AND id_categoria = id_categoria_lc) THEN
            INSERT INTO Libro_Categoria (id_libro,id_categoria)
            VALUES (id_libro_lc,id_categoria_lc);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: La relación libro-categoria ya existe';
        END IF;
    END $$

 -- **--------------
    -- Modificar NORMAL
    -- **-------------
    CREATE PROCEDURE modificar_libro_categoria(IN id_lc INT,IN id_libro_lc INT, IN id_categoria_lc INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM Libro_Categoria WHERE id_libro = id_libro_lc AND id_categoria = id_categoria_lc) THEN
            UPDATE Libro_Categoria
            SET id_libro = id_libro_lc,
            id_categoria = id_categoria_lc
            WHERE id_libro_categoria = id_lc;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: La relación libro-categoria no existe';
        END IF;
    END $$

    -- **--------------
    -- eliminar NORMAL
    -- **-------------
    CREATE PROCEDURE eliminar_libro_categoria(IN id_libro_categoria_lc INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM Libro_Categoria WHERE id_libro_categoria = id_libro_categoria_lc) THEN
            DELETE FROM Libro_Categoria WHERE id_libro_categoria = id_libro_categoria_lc;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: La relación libro-categoria no existe';
        END IF;
    END $$

    -- **----------------
    -- INSERTAR DEFINITIVO
    -- **----------------
    CREATE PROCEDURE insert_libro_categoria_def()
    BEGIN
        DECLARE libroCategoriaError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en insertar libro-categoria';
        END;
        START TRANSACTION;
        CALL insert_libro_categoria(1,1);
        CALL insert_libro_categoria(2,2);
        CALL insert_libro_categoria(3,3);
        CALL insert_libro_categoria(4,4);
        CALL insert_libro_categoria(5,1);

        SET libroCategoriaError = "errorr";
        -- CALL insert_libro_categoria(1,libroCategoriaError);
        COMMIT;
    END $$

    -- **----------------
    -- modicicar DEFINITIVO
    -- **----------------

    CREATE PROCEDURE modificar_libro_categoria_def()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en modificar libro-categoria';
        END;
        START TRANSACTION;
        CALL modificar_libro_categoria(1,4,4);
        CALL modificar_libro_categoria(2,2,1);

        COMMIT;
    END $$

    -- **----------------
    -- eliminar DEFINITIVO
    -- **----------------

    CREATE PROCEDURE eliminar_libro_categoria_def()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en eliminar libro-categoria';
        END;
        START TRANSACTION;
        CALL eliminar_libro_categoria(5);
        COMMIT;
    END $$

    -- **----------------
    -- categoria-libros God
    -- **----------------

    CREATE PROCEDURE Libro_Categoria_god()
    BEGIN
         DECLARE EXIT HANDLER FOR SQLEXCEPTION
         BEGIN
            ROLLBACK;
            SELECT 'Error, error en libro-categoria god';
        END;
        START TRANSACTION;
        CALL insert_libro_categoria_def();
        CALL modificar_libro_categoria_def();
        CALL eliminar_libro_categoria_def();

        COMMIT;
    END $$










DELIMITER ;

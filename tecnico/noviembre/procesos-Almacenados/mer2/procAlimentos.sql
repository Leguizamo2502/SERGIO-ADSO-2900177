DELIMITER $$

-- **----------------
-- Insertar Noraml
-- ** ---------------
    CREATE PROCEDURE insert_alimento(IN nombre_a VARCHAR(30),IN cantidad_a INT,IN id_ta INT, IN id_z INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM alimentos WHERE id_alimento = id_ta AND id_zoologico = id_z) THEN
            INSERT INTO alimentos(nombre,cantidad,id_TipoAlimento,id_zoologico)
            VALUES(nombre_a,cantidad_a,id_ta,id_z);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error, el alimento ya está registrado';
        END IF;
    END $$ 
    -- **----------------
-- Modificar Noraml
-- ** ---------------
    CREATE PROCEDURE modificar_alimento(IN id_a INT,IN nombre_a VARCHAR(30),IN cantidad_a INT,IN id_ta INT, IN id_z INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM alimentos WHERE id_tipoAlimento=id_ta AND id_zoologico = id_z) THEN
            UPDATE alimentos
            SET nombre = nombre_a,
            cantidad = cantidad_a,
            id_tipoAlimento = id_ta,
            id_zoologico = id_z
            WHERE id_alimento = id_a;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error en modificar';
        END IF;
    END $$ 

    -- **----------------
-- Eliminar Noraml
-- ** ---------------
    CREATE PROCEDURE eliminar_alimento(IN id_a INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM alimentos WHERE id_alimento = id_a) THEN
            DELETE FROM alimentos WHERE id_alimento = id_a;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error en modificar';
        END IF;
    END $$ 

    -- **----------------
-- Insertar DEFINITIVO
-- ** ---------------
    CREATE PROCEDURE insert_alimento_def()
    BEGIN
        DECLARE alimentoError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en insertar def';
        END;
        START TRANSACTION;
        CAll insert_alimento('Filete',5,1,1);
        CAll insert_alimento('Pollo',15,2,2);
        CAll insert_alimento('Col',51,3,3);
        CAll insert_alimento('Salmon',9,4,4);

        SET alimentoError = NULL;
        COMMIT;
    END $$

  -- **----------------
-- MOdificar DEFINITIVO
-- ** ---------------
    CREATE PROCEDURE modificar_alimento_def()
    BEGIN
        DECLARE alimentoError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'error en modificar def';
        END;
        START TRANSACTION;
        CALL modificar_alimento(1,'cerdo',10,2,1);
        CALL modificar_alimento(2,'Lomo',2,1,2);
        SET alimentoError = NULL;
        COMMIT;
    END $$
     -- **----------------
-- Eliminar DEFINITIVO
-- ** ---------------
    CREATE PROCEDURE eliminar_alimento_def()
    BEGIN
        DECLARE alimentoError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'error en eliminar def';
        END;
        CALL eliminar_alimento(4);
        SET alimentoError = NULL;
        COMMIT;
    END $$

      -- **----------------
-- alimento god
-- ** ---------------
CREATE PROCEDURE alimento_god()
BEGIN
    
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'error en alimento god';
        END;
        CALL insert_alimento_def();
        CALL modificar_alimento_def();
        CALL eliminar_alimento_def();
        COMMIT;
    END $$



DELIMITER ;
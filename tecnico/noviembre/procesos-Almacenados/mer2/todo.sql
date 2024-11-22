DELIMITER $$
    -- **--------------
    -- Insetar normal
    -- **--------------
    CREATE PROCEDURE insert_zoologico(IN nombre_z VARCHAR(30), IN direccion_z VARCHAR(30))
        BEGIN
        IF NOT EXISTS (SELECT 1 FROM zoologico WHERE nombre = nombre_z AND direccion= direccion_z) THEN
            INSERT INTO zoologico(nombre,direccion)
            VALUES (nombre_z,direccion_z);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error,el zoologico ya existe';
        END IF;
    END $$


    -- **-----------------
    -- Modificar normal
    -- **-----------------
    CREATE PROCEDURE modificar_zoologico(IN id_z INT, IN nombre_z VARCHAR(30), IN direccion_z VARCHAR(30))
        BEGIN
        IF EXISTS  (SELECT 1 FROM zoologico WHERE id_zoologico = id_z) THEN
            UPDATE zoologico
            SET nombre = nombre_z, direccion=direccion_z
            WHERE id_zoologico = id_z;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Error,el zoologico no se encuentra';
        END IF;
    END $$

    -- **-----------------
    -- Eliminar normal
    -- **-----------------

    CREATE PROCEDURE eliminar_zoologico(IN id_z INT)
        BEGIN 
        IF EXISTS(SELECT 1 FROM zoologico WHERE id_zoologico = id_z) THEN
            DELETE FROM zoologico WHERE id_zoologico=id_z;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: zoologico no encontrado';
        END IF;
    END $$


     -- **-----------------
    -- isnertar DEFINITIVO
    -- **-----------------
    CREATE PROCEDURE insertar_zoologico_def()
    BEGIN
        DECLARE zoologicoError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error al insertar';
        END;
        START TRANSACTION;
        CALL insert_zoologico('Zoologico Nacional', 'Av. Principal 123');
        CALL insert_zoologico('Safari Park', 'Carretera Norte Km 45');
        CALL insert_zoologico('Zoologico Urbano', 'Calle Central 567');
        CALL insert_zoologico('Reserva Fauna Silvestre', 'Ruta 33, Sector Sur');
        CALL insert_zoologico('Aventura Animal', 'Av. de la Libertad 789');

        SET zoologicoError = NULL;
        COMMIT;
    END $$

    -- **-----------------
    -- Modificar DEFINITIVO
    -- **-----------------
        CREATE PROCEDURE modificar_zoologico_def()
        BEGIN 
            DECLARE zoologicoError INT;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error, error al modificar';
            END;
            START TRANSACTION;
            CALL modificar_zoologico(1,'hello','calle 8');
            CALL modificar_zoologico(2,'cambio','carrera 9');

            SET zoologicoError= NULL;
            COMMIT;
        END $$

    -- **-----------------
    -- Eliminar DEFINITIVO
    -- **-----------------
    CREATE PROCEDURE eliminar_zoologico_def()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error al eliminar def';
        END;
        START TRANSACTION;
        CALL eliminar_zoologico(5);

        COMMIT;
    END $$

    -- **-----------------
    -- God zoologico
    -- **-----------------
    CREATE PROCEDURE zoologico_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error, error en zoologico god';
        END;
        START TRANSACTION;
        CALL insertar_zoologico_def();
        CALL modificar_zoologico_def();
        CALL eliminar_zoologico_def();

        COMMIT;
    END $$


DELIMITER ;
DELIMITER $$
     -- **--------------
    -- Insertar normal
    -- **--------------
    CREATE PROCEDURE insert_especie(IN nombre_e VARCHAR(30))
        BEGIN
        IF NOT EXISTS (SELECT 1 FROM especie WHERE nombre = nombre_e) THEN
            INSERT INTO especie(nombre)
            VALUES (nombre_e);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, la especie ya esta registrada';
        END IF;
    END $$

     -- **--------------
    -- Mofificar normal
    -- **--------------
    CREATE PROCEDURE modificar_especie(IN id_e INT,IN nombre_e VARCHAR(30))
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            UPDATE especie
            SET nombre = nombre_e
            WHERE id_especie = id_e;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT ='Error, error en modificar especie';
        END IF;
    END $$

     -- **--------------
    -- Eliminar normal
    -- **--------------
    CREATE PROCEDURE eliminar_especie(IN id_e INT)
        BEGIN
        IF EXISTS (SELECT 1 FROM especie WHERE id_especie = id_e) THEN
            DELETE FROM especie WHERE id_especie = id_e;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT= 'Error, error en eliminar especie';
        END IF;
    END $$


    -- **------------------
    -- Insertar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE insert_especie_def()
    BEGIN
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al insertar def';
        END;
        START TRANSACTION;
        CALL insert_especie('Felino');
        CALL insert_especie('Ave');
        CALL insert_especie('Reptil');
        CALL insert_especie('Mamífero');

        SET especieError=NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Modificar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE modificar_especie_def()
    BEGIN   
        DECLARE especieError INT;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error al modificar def';
        END;
        START TRANSACTION;
        CALL modificar_especie(1,'Canino');
        CALL modificar_especie(2,'Anfibio');

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Eliminar DEFINITIVO
    -- **------------------
    CREATE PROCEDURE eliminar_especie_def()
    BEGIN
        DECLARE especieError VARCHAR(30);
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en eliminar def';
        END;
        START TRANSACTION;
        CALL eliminar_especie(4);

        SET especieError = NULL;
        COMMIT;
    END $$

    -- **------------------
    -- Especie god
    -- **------------------
    CREATE PROCEDURE especie_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en especie god';
        END;
        START TRANSACTION;
        CALL insert_especie_def();
        CALL modificar_especie_def();
        CALL eliminar_especie_def();

        COMMIT;
    END $$


DELIMITER ;

DELIMITER $$
    -- **--------------
    -- Insertar normal
    -- **--------------
    CREATE PROCEDURE insert_visitante (IN nombre_v VARCHAR(30),IN fecha_visita_v DATE,IN id_zoologico_v INT)
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM visitante WHERE id_zoologico = id_zoologico AND nombre = nombre_v) THEN
            INSERT INTO visitante(nombre,fecha_visita,id_zoologico)
            VALUES (nombre_v,fecha_visita_v,id_zoologico_v);
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en insertar, el visitante ya existe';
        END IF;
    END $$

    -- **--------------
    -- Mofificar normal
    -- **--------------
    CREATE PROCEDURE modificar_visitante (IN id_v INT,nombre_v VARCHAR(30),IN fecha_visita_v DATE, IN id_zoologico_v INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM visitante WHERE id_visitante = id_v AND id_zoologico = id_zoologico_v) THEN
            UPDATE visitante
            SET nombre = nombre_v,
            fecha_visita = fecha_visita_v,
            id_zoologico = id_zoologico_v
            WHERE id_visitante = id_zoologico_v;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en modificar';
        END IF;
    END $$
    -- **--------------
    -- Eliminar normal
    -- **--------------
    CREATE PROCEDURE eliminar_visitante (IN id_v INT)
    BEGIN
        IF EXISTS (SELECT 1 FROM visitante WHERE id_visitante = id_v) THEN
            DELETE FROM visitante WHERE id_visitante = id_v;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error en eliminar';
        END IF;
    END $$

    -- **--------------
    -- Insertar DEFENITIVO  
    -- **--------------
        CREATE PROCEDURE insert_visitante_def()
        BEGIN 
            DECLARE visitanteError INT;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error en insertar def';
            END;
            START TRANSACTION;
            CALL insert_visitante('Ruben Leguizamo','2024-11-24',1);
            CALL insert_visitante('Ana Gómez','2024-11-13', 2);
            CALL insert_visitante('Carlos López','2024-11-15', 3);
            CALL insert_visitante('María Fernández','2024-11-18', 4);
            

            COMMIT;
        END $$

    -- **-------------------
    -- Modificar DEFENITIVO  
    -- **------------------
        CREATE PROCEDURE modificar_visitante_def()
        BEGIN
            DECLARE visitanteError INt;
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Érror en modificar def';
            END;
            START TRANSACTION;
            CALL modificar_visitante(1,'Sergio Leguizamo','2024-10-24',1);
            CALL modificar_visitante(2,'Loren Leguizamo','2024-11-24',2);
            COMMIT;
        END $$

    -- **-------------------
    -- Eliminar DEFENITIVO  
    -- **------------------
        CREATE PROCEDURE eliminar_visitante_def()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                ROLLBACK;
                SELECT 'Error en eliminar def';
            END;
            START TRANSACTION;
            CALL eliminar_visitante(4);
            COMMIT;
        END $$

        -- **-------------------
    -- visitamnte GOD 
    -- **------------------

    CREATE PROCEDURE visitante_god()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en visitante god';
        END;
        START TRANSACTION;
        CALL insert_visitante_def();
        CALL modificar_visitante_def();
        CALL eliminar_visitante_def();

        COMMIT;
    END $$
    
DELIMITER ;

DELIMITER $$

-- **-------------- 
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_tipoAlimento(IN nombre_ta VARCHAR(30))
    BEGIN
    IF NOT EXISTS (SELECT 1 FROM tipoAlimento WHERE nombre = nombre_ta) THEN
        INSERT INTO tipoAlimento(nombre)
        VALUES (nombre_ta);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el tipo de alimento ya está registrado';
    END IF;
END $$

-- **-------------- 
-- Modificar normal
-- **--------------
CREATE PROCEDURE modificar_tipoAlimento(IN id_ta INT, IN nombre_ta VARCHAR(30))
    BEGIN
    IF EXISTS (SELECT 1 FROM tipoAlimento WHERE id_tipoAlimento = id_ta) THEN
        UPDATE tipoAlimento
        SET nombre = nombre_ta
        WHERE id_tipoAlimento = id_ta;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Error, error al modificar tipo de alimento';
    END IF;
END $$

-- **-------------- 
-- Eliminar normal
-- **--------------
CREATE PROCEDURE eliminar_tipoAlimento(IN id_ta INT)
    BEGIN
    IF EXISTS (SELECT 1 FROM tipoAlimento WHERE id_tipoAlimento = id_ta) THEN
        DELETE FROM tipoAlimento WHERE id_tipoAlimento = id_ta;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Error, error al eliminar tipo de alimento';
    END IF;
END $$

-- **------------------ 
-- Insertar DEFINITIVO
-- **------------------
CREATE PROCEDURE insert_tipoAlimento_def()
BEGIN
    DECLARE tipoAlimentoError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al insertar tipo de alimento def';
    END;
    START TRANSACTION;
    CALL insert_tipoAlimento('Carne');
    CALL insert_tipoAlimento('Frutas');
    CALL insert_tipoAlimento('Vegetales');
    CALL insert_tipoAlimento('Insectos');
    CALL insert_tipoAlimento('Pescado');

    SET tipoAlimentoError = NULL;
    COMMIT;
END $$

-- **------------------ 
-- Modificar DEFINITIVO
-- **------------------
CREATE PROCEDURE modificar_tipoAlimento_def()
BEGIN   
    DECLARE tipoAlimentoError INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al modificar tipo de alimento def';
    END;
    START TRANSACTION;
    CALL modificar_tipoAlimento(1, 'Carne y Huesos');
    CALL modificar_tipoAlimento(2, 'Frutas Tropicales');

    SET tipoAlimentoError = NULL;
    COMMIT;
END $$

-- **------------------ 
-- Eliminar DEFINITIVO
-- **------------------
CREATE PROCEDURE eliminar_tipoAlimento_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar tipo de alimento def';
    END;

    START TRANSACTION;
    CALL eliminar_tipoAlimento(5);

    COMMIT;
END $$

-- **------------------ 
-- TipoAlimento god
-- **------------------
CREATE PROCEDURE tipoAlimento_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en tipo de alimento god';
    END;
    START TRANSACTION;
    CALL insert_tipoAlimento_def();
    CALL modificar_tipoAlimento_def();
    CALL eliminar_tipoAlimento_def();

    COMMIT;
END $$

DELIMITER ;
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

DELIMITER $$

-- **--------------
-- Insertar normal
-- **--------------
CREATE PROCEDURE insert_habitat (
    IN nombre_h VARCHAR(30),
    IN tipo_h VARCHAR(30),
    IN capacidad_h INT,
    IN id_zoologico_h INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE nombre = nombre_h AND id_zoologico = id_zoologico_h
    ) THEN
        INSERT INTO habitat(nombre, tipo, capacidad, id_zoologico)
        VALUES (nombre_h, tipo_h, capacidad_h, id_zoologico_h);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en insertar, el hábitat ya existe';
    END IF;
END $$

-- **--------------
-- Modificar normal
-- **--------------
CREATE PROCEDURE modificar_habitat (
    IN id_h INT,
    IN nombre_h VARCHAR(30),
    IN tipo_h VARCHAR(30),
    IN capacidad_h INT,
    IN id_zoologico_h INT
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE id_habitat = id_h AND id_zoologico = id_zoologico_h
    ) THEN
        UPDATE habitat
        SET nombre = nombre_h,
            tipo = tipo_h,
            capacidad = capacidad_h,
            id_zoologico = id_zoologico_h
        WHERE id_habitat = id_h;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$

-- **--------------
-- Eliminar normal
-- **--------------
CREATE PROCEDURE eliminar_habitat (IN id_h INT)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM habitat 
        WHERE id_habitat = id_h
    ) THEN
        DELETE FROM habitat WHERE id_habitat = id_h;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en eliminar';
    END IF;
END $$

-- **--------------
-- Insertar DEFINITIVO
-- **--------------
CREATE PROCEDURE insert_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar def';
    END;
    START TRANSACTION;
    CALL insert_habitat('Sabana', 'Terrestre', 15, 1);
    CALL insert_habitat('Arrecife', 'Acuático', 10, 2);
    CALL insert_habitat('Bosque', 'Selvático', 20, 3);
    CALL insert_habitat('Desierto', 'Árido', 5, 4);
    COMMIT;
END $$

-- **-------------------
-- Modificar DEFINITIVO
-- **-------------------
CREATE PROCEDURE modificar_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar def';
    END;
    START TRANSACTION;
    CALL modificar_habitat(1, 'Pradera', 'Terrestre', 18, 1);
    CALL modificar_habitat(2, 'Laguna', 'Acuático', 12, 2);
    COMMIT;
END $$

-- **-------------------
-- Eliminar DEFINITIVO
-- **-------------------
CREATE PROCEDURE eliminar_habitat_def()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar def';
    END;
    START TRANSACTION;
    CALL eliminar_habitat(4);
    COMMIT;
END $$

-- **-------------------
-- Habitat GOD
-- **-------------------
CREATE PROCEDURE habitat_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en habitat god';
    END;
    START TRANSACTION;
    CALL insert_habitat_def();
    CALL modificar_habitat_def();
    CALL eliminar_habitat_def();
    COMMIT;
END $$

DELIMITER ;


DELIMITER $$

-- **----------------
-- Insertar Normal
-- **----------------
CREATE PROCEDURE insert_listaAnimales(IN id_z INT, IN id_a INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM listaAnimales WHERE id_zoologico = id_z AND id_animal = id_a) THEN
        INSERT INTO listaAnimales(id_zoologico, id_animal)
        VALUES (id_z, id_a);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal ya está registrado en esta lista.';
    END IF;
END $$
DELIMITER ;
-- **----------------
-- Modificar Normal
-- **----------------

DELIMITER $$

CREATE PROCEDURE modificar_listaAnimales(IN id_l INT, IN id_z INT, IN id_a INT)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM listaAnimales 
        WHERE id_zoologico = id_z AND id_animal = id_a
    ) THEN
        UPDATE listaAnimales
        SET id_zoologico = id_z,
            id_animal = id_a
        WHERE id_listaAnimales = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$

DELIMITER ;


DELIMITER $$
-- **----------------
-- Eliminar Normal
-- **----------------
CREATE PROCEDURE eliminar_listaAnimales(IN id_l INT)
BEGIN
    IF EXISTS (SELECT 1 FROM listaAnimales WHERE id_listaAnimales = id_l) THEN
        DELETE FROM listaAnimales WHERE id_listaAnimales = id_l;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en eliminar';
    END IF;
END $$

-- **----------------
-- Insertar Definitivo
-- **----------------
CREATE PROCEDURE insert_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar definitivo';
    END;
    START TRANSACTION;
    CALL insert_listaAnimales(1, 1);
    CALL insert_listaAnimales(2, 2);
    CALL insert_listaAnimales(2, 1);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- Modificar Definitivo
-- **----------------
CREATE PROCEDURE modificar_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar definitivo';
    END;
    START TRANSACTION;
    CALL modificar_listaAnimales(1, 1, 2);
    CALL modificar_listaAnimales(2, 3, 2);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- Eliminar Definitivo
-- **----------------
CREATE PROCEDURE eliminar_listaAnimales_def()
BEGIN
    DECLARE listaError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar definitivo';
    END;
    START TRANSACTION;
    CALL eliminar_listaAnimales(2);
    SET listaError = NULL;
    COMMIT;
END $$

-- **----------------
-- ListaAnimales GOD
-- **----------------
CREATE PROCEDURE listaAnimales_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en listaAnimales GOD';
    END;
    START TRANSACTION;
    CALL insert_listaAnimales_def();
    CALL modificar_listaAnimales_def();
    CALL eliminar_listaAnimales_def();
    COMMIT;
END $$

DELIMITER ;

DELIMITER $$

-- **----------------
-- Insertar Normal
-- ** ---------------
CREATE PROCEDURE insert_animal(
    IN nombre_a VARCHAR(30),
    IN genero_a VARCHAR(30),
    IN id_es INT,
    IN id_hab INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales WHERE nombre = nombre_a AND id_es AND id_habitat = id_hab) THEN
        INSERT INTO animales(nombre, genero, id_especie, id_habitat)
        VALUES (nombre_a, genero_a, id_es, id_hab);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal ya está registrado';
    END IF;
END $$ 

-- **----------------
-- Modificar Normal
-- ** ---------------
CREATE PROCEDURE modificar_animal(
    IN id_a INT,
    IN nombre_a VARCHAR(30),
    IN genero_a VARCHAR(30),
    IN id_es INT,
    IN id_hab INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM animales WHERE nombre = nombre_a AND id_especie = id_es AND id_habitat = id_hab) THEN
        UPDATE animales
        SET nombre = nombre_a,
            genero = genero_a,
            id_especie = id_es,
            id_habitat = id_hab
        WHERE id_animal = id_a;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en modificar';
    END IF;
END $$ 

-- **----------------
-- Eliminar Normal
-- ** ---------------
CREATE PROCEDURE eliminar_animal(IN id_a INT)
BEGIN
    IF EXISTS (SELECT 1 FROM animales WHERE id_animal = id_a) THEN
        DELETE FROM animales WHERE id_animal = id_a;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error, el animal no existe';
    END IF;
END $$ 

-- **----------------
-- Insertar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE insert_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en insertar def';
    END;
    START TRANSACTION;
    CALL insert_animal('Tigre', 'Macho', 1, 1);
    CALL insert_animal('Cebra', 'Hembra', 2, 2);
    CALL insert_animal('Pingüino', 'Macho', 3, 3);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Modificar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE modificar_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en modificar def';
    END;
    START TRANSACTION;
    CALL modificar_animal(1, 'Tigre Blanco', 'Macho', 1, 2);
    CALL modificar_animal(2, 'Cebra Rayada', 'Hembra', 2, 1);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Eliminar DEFINITIVO
-- ** ---------------
CREATE PROCEDURE eliminar_animal_def()
BEGIN
    DECLARE animalError VARCHAR(30);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en eliminar def';
    END;
    START TRANSACTION;
    CALL eliminar_animal(3);
    SET animalError = NULL;
    COMMIT;
END $$

-- **----------------
-- Animal GOD
-- ** ---------------
CREATE PROCEDURE animal_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en animal god';
    END;
    START TRANSACTION;
    CALL insert_animal_def();
    CALL modificar_animal_def();
    CALL eliminar_animal_def();
    COMMIT;
END $$

DELIMITER ;


DELIMITER $$
-- **-----------
-- DURO
-- **------------
    CREATE PROCEDURE todoPoderoso()
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            ROLLBACK;
            SELECT 'Error en todo poderoso';
        END;
        START TRANSACTION;
        CALL zoologico_god();
        CALL especie_god();
        CALL visitante_god();
        CALL tipoAlimento_god();
        CALL alimento_god();
        CALL habitat_god();
        CALL animal_god();
        CALL listaAnimales_god();
        CALL animales_alimentos_god();

        SELECT * FROM zoologico;
        SELECT * FROM especie;
        SELECT * FROM visitante;
        SELECT * FROM tipoAlimento;
        SELECT * FROM alimentos;
        SELECT * FROM habitat;
        SELECT * FROM animales;
        SELECT * FROM listaAnimales;
        SELECT * FROM animales_alimentos;

        COMMIT;
    END $$

DELIMITER ;  
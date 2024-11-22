DELIMITER $$

CREATE PROCEDURE todoPoderoso()
BEGIN
    -- Manejador general para errores de la transacción
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        SELECT 'Error en todo poderoso' AS resultado;
    END;



    -- Llamadas a los procedimientos con manejadores específicos
    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en zoologico god' AS resultado;
        END;
        CALL zoologico_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en especie god' AS resultado;
        END;
        CALL especie_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en visitante god' AS resultado;
        END;
        CALL visitante_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en tipoAlimento god' AS resultado;
        END;
        CALL tipoAlimento_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en alimento god' AS resultado;
        END;
        CALL alimento_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en habitat god' AS resultado;
        END;
        CALL habitat_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en animal god' AS resultado;
        END;
        CALL animal_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en listaAnimales god' AS resultado;
        END;
        CALL listaAnimales_god();
    END;

    BEGIN
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            SELECT 'Error en animales_alimentos god' AS resultado;
        END;
        CALL animales_alimentos_god();
    END;

    -- Mostrar tablas relevantes
    SELECT * FROM zoologico;
    SELECT * FROM especie;
    SELECT * FROM visitante;
    SELECT * FROM tipoAlimento;
    SELECT * FROM alimentos;
    SELECT * FROM habitat;
    SELECT * FROM animales;
    SELECT * FROM listaAnimales;
    SELECT * FROM animales_alimentos;



END $$

DELIMITER ;

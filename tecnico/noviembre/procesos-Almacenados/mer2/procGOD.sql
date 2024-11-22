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
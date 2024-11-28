DELIMITER $$    
CREATE PROCEDURE proc_god()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
            CALL proc_zoologico(7,'jeje','calle 3 sur');
            select * from zoologico;

            CALL proc_habitat(6,'noseee','menos',12,2);
            select * from habitat;

            CALL proc_especie(6,'gato');
            select * from especie;

            CALL proc_animales(5, 'Rex', 'Macho', 1, 4);
            select * from animales;

            CALL proc_listaAnimales(5,1,4);
            select * from listaAnimales;

            CALL proc_tipoAlimento(5,'Heno');
            select * from tipoALimento;
            
            CALL proc_visitante(5,'Llita','2024-09-03',5);
            select * from visitante;

            CALL proc_alimentos(5, 'carne cerdo',20,4,1);
            select * from alimentos;

            CALL proc_animales_alimentos(5,14,1,3);

            select * from animales_alimentos;
    COMMIT;
END $$
DELIMITER ;

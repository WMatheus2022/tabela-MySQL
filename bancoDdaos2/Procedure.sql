DELIMITER $$

CREATE PROCEDURE LevantamentoDiarioProdutos()
BEGIN
    DECLARE data_anterior DATE;
    DECLARE data_atual DATE;
    
    SET data_anterior = NULL;
    SET data_atual = NULL;

    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
        SELECT DATE(data_compra) AS data_compra, COUNT(*) AS qtd_produtos
        FROM compras
        GROUP BY DATE(data_compra);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO data_atual, qtd_produtos;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF data_anterior IS NOT NULL AND data_anterior <> data_atual THEN
            -- Imprime o resultado para o dia anterior
            SELECT CONCAT("No dia ", data_anterior, " foram comprados ", qtd_produtos, " produtos.") AS Relatorio;
        END IF;
        
        SET data_anterior = data_atual;
    END LOOP;
    
    CLOSE cur;
    
    -- Imprime o resultado para o último dia
    IF data_atual IS NOT NULL THEN
        SELECT CONCAT("No dia ", data_atual, " foram comprados ", qtd_produtos, " produtos.") AS Relatorio;
    END IF;
END $$

DELIMITER ;
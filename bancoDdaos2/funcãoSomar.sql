DELIMITER $$

CREATE FUNCTION SomarClientesCadastradosNoDia(data_consulta DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_clientes INT;
    
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;
    
    RETURN total_clientes;
END $$

DELIMITER ;



SELECT SomarClientesCadastradosNoDia('2023-10-01');
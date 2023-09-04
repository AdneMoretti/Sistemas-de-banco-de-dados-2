


DELIMITER //
CREATE FUNCTION countPeople () RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE quantidade INT;
SELECT COUNT(*) INTO quantidade FROM pessoa;
RETURN quantidade;
END //
DELIMITER ;


-- 3) 
DELIMITER //
CREATE FUNCTION countProduct (productName VARCHAR(80)) RETURNS INT
DETERMINISTIC
BEGIN 
DECLARE quantidade INT;
SELECT COUNT(*) INTO quantidade FROM produtos WHERE nome = productName;
RETURN quantidade;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION getValue (productId INT) RETURNS FLOAT
deterministic
BEGIN 
DECLARE quantidade FLOAT;
DECLARE preco_total FLOAT;
SELECT qtde, preco INTO quantidade, preco_total FROM produtos WHERE idProduto = productId;
RETURN (quantidade * preco_total);
END //
DELIMITER ;


SELECT getValue(2) AS total_value;

DROP FUNCTION getValue;



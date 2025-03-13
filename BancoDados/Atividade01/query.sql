-- a) Crie uma equação que permita listar o nome de produtos e a quantidade de um determinado pedido.

SELECT p.names, po.quantity FROM orders o 
LEFt JOIN product_orders po ON po.oId = o.id 
LEFT JOIN products p ON p.id = po.pId WHERE o.id = 1;

-- b) Precisamos de uma procedure para limitar os pedidos apenas a mesas que estejam em atendimento

DELIMITER //

CREATE PROCEDURE AddOrders(IN oId INT,IN pId INT,IN quantity INT)
BEGIN
    IF EXISTS (SELECT o.id FROM orders o WHERE o.status = 'open' AND o.id = oId ) THEN
        CALL UpdateQuantity(oId, pId, quantity);
    ELSE
        SELECT 'Comanda nao aberta para pedidos' AS message;
    END IF;
END //

CALL AddOrders(1, 2, 3);

-- c) Crie uma procedure que permita atualizar a quantidade de um produto em um pedido

DELIMITER //

    CREATE PROCEDURE UpdateQuantity(IN oId INT, IN pId INT, IN quantity INT)
    BEGIN
    IF EXISTS (SELECT po.quantity FROM product_orders po WHERE po.oid = oId AND po.pid = pId) THEN
        UPDATE product_orders po SET po.quantity = (po.quantity + quantity) WHERE po.oid = oId AND po.pid = pId;
    ELSE
        INSERT INTO product_orders(pid, oid, quantity) VALUES (pId, oId, quantity);
    END IF;

END //

-- d) Crie uma equação para listar o nome dos produtos a quantidade o valor total de cada produto e o valor total da compra

SELECT p.names, po.quantity, SUM(p.price * po.quantity) AS totals, SUM(totals) AS totalValue FROM orders o
LEFT JOIN product_orders po ON po.oId = o.id
LEFT JOIN products p ON p.id = po.pId WHERE o.id = 1 GROUP BY p.names, po.quantity;
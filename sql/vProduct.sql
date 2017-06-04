DROP VIEW IF EXISTS VProduct;
CREATE VIEW VProduct AS
SELECT
	P.id,
    P.description,
	P.image,
    GROUP_CONCAT(category) AS category,
	P.price,
	I.items
FROM Product AS P
	INNER JOIN Prod2Cat AS P2C
		ON P.id = P2C.prod_id
	INNER JOIN ProdCategory AS PC
		ON PC.id = P2C.cat_id
	INNER JOIN Inventory AS I
		ON P.id = I.prod_id
GROUP BY P.id
ORDER BY P.description
;

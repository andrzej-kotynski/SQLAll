USE SAMPLEDB
GO

/*

Operator			Description
=					Equal
<>					Not equal
!=					Not equal
<					Less than
<=					Less than or equal to
>					Greater than
>=					Greater than or equal to

*/

SELECT 
	product_id,
	category_id,
	list_price
FROM oes.products
WHERE list_price < 40;



SELECT 
	product_id,
	category_id,
	list_price
FROM oes.products
WHERE list_price BETWEEN 40 AND 60;



SELECT 
	product_id,
	category_id,
	list_price
FROM oes.products
WHERE list_price >= 40
AND	list_price <= 60;
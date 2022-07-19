USE SAMPLEDB
GO

--first challange
SELECT *
FROM oes.products
WHERE list_price > 100;

--second challange
SELECT *
FROM oes.orders
WHERE shipped_date IS NULL;

--third challange
SELECT *
FROM oes.orders
WHERE order_date = '2020-02-26'; -- that or '20200226'

--fourth challenge
SELECT *
FROM oes.orders
WHERE order_date >= '2020-01-01'; -- that or '20200101'
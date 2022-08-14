/*CASE Expression Challanges*/
USE SAMPLEDB
GO

-- First Challange
--Select the following columns from the oes.products table:
--• product_id
--• product_name
--• discontinued
--Include a CASE expression in the SELECT statement called
--discontinued_description. Give this expression the string
--‘No’ when the discontinued column equals 0 and a string of
--‘Yes’ when the discontinued column equals 1. In all other
--cases give the expression the string of ‘unknown’.

SELECT 
	product_id, 
	product_name, 
	discontinued,
	CASE WHEN discontinued = 0 THEN 'No'
		 WHEN discontinued = 1 THEN 'Yes'
		 ELSE 'unknown'
		 END AS discontinued_description
FROM oes.products;

-- another way:
SELECT 
	product_id, 
	product_name, 
	discontinued,
	CASE discontinued
		 WHEN 0 THEN 'No'
		 WHEN 1 THEN 'Yes'
		 ELSE 'unknown'
		 END AS discontinued_description
FROM oes.products;


-- Second Challange
--Challenge:
--Select the following columns from the oes.products table:
--• product_id
--• product_name
--• list_price
--• Include a CASE expression in the SELECT statement called
--price_grade. For this expression..
--• If list_price is less than 50 then give the string ‘Low’.
--• If list_price is greater than or equal to 50 and list_price is
--less than 250 then give the string ‘Medium’.
--• If list_price is greater than or equal to 250 then give the
--string ‘High’.
--• In all other cases, give the expression the string of ‘unknown’.

SELECT 
	product_id, 
	product_name, 
	list_price,
	CASE WHEN list_price < 50 THEN 'Low'
		 WHEN list_price >= 50  AND list_price < 250 THEN 'Medium'
		 WHEN list_price >= 250 THEN 'High'
		 ELSE 'unknown'
		 END AS price_grade
FROM oes.products;


-- Third Challange
--Challenge:
--• Select the following columns from the oes.orders table:
--• order_id
--• order_date
--• shipped_date
--• Include a CASE expression called shipping_status which
--	determines the difference in days between the order_date and
--	the shipped_date. When this difference is less than or equal to 7
--	then give the string value ‘Shipped within one week’.
--• If the difference is greater than 7 days, then give the string
--	‘Shipped over a week later’.
--• If shipped_date is null then give the string ‘Not yet shipped’.

SELECT 
	order_id,
	order_date,
	shipped_date,
	CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
		 WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
		 WHEN shipped_date IS NULL THEN 'Not yet shipped'
		 ELSE 'unknown'
		 END AS shipping_status
FROM oes.orders;

-- another approach
WITH cte AS
(
SELECT
	order_id,
	order_date,
	shipped_date,
	DATEDIFF(day, order_date, shipped_date) AS shipping_days
	FROM oes.orders
)
SELECT
	order_id,
	order_date,
	shipped_date,
	CASE WHEN shipping_days <= 7 THEN 'Shipped within one week'
		 WHEN shipping_days > 7 THEN 'Shipped over a week later'
		 WHEN shipped_date IS NULL THEN 'Not yet shipped'
		 END AS shipping_status
FROM cte;

-- Fourth Challange
--Repeat the third challenge to derive the shipping_status
--expression, but this time get the count of orders by the
--shipping_status expression.

WITH days_difference
AS
(
SELECT 
	order_id,
	order_date,
	shipped_date,
	CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
		 WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
		 WHEN shipped_date IS NULL THEN 'Not yet shipped'
		 ELSE 'unknown'
		 END AS shipping_status
FROM oes.orders
)
SELECT dd.shipping_status, COUNT(*) AS order_count
FROM days_difference dd
GROUP BY dd.shipping_status;

-- using derived table:
SELECT
	s.shipping_status,
	COUNT(*) AS order_count_by_status
FROM 
(
SELECT 
	order_id,
	order_date,
	shipped_date,
	CASE WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
		 WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
		 WHEN shipped_date IS NULL THEN 'Not yet shipped'
		 ELSE 'unknown'
		 END AS shipping_status
FROM oes.orders
) s
GROUP BY s.shipping_status;

-- using 2 CTEs
WITH cte1 AS
(
SELECT
	shipped_date,
	DATEDIFF(day, order_date, shipped_date) AS shipping_days
	FROM oes.orders
),
cte2 AS
(
SELECT
	shipped_date,
	CASE WHEN shipping_days <= 7 THEN 'Shipped within one week'
		 WHEN shipping_days > 7 THEN 'Shipped over a week later'
		 WHEN shipped_date IS NULL THEN 'Not yet shipped'
		 ELSE 'unknown'
		 END AS shipping_status
FROM cte1
)
SELECT
	cte2.shipping_status,
	COUNT(*) AS order_count_by_status
FROM cte2
GROUP BY cte2.shipping_status;
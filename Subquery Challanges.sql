USE SAMPLEDB
GO

-- First Challange
--Return the following product details for the cheapest
--product(s) in the oes.products table:
--- product_id
--- product_name
--- list_price
--- category_id

-- Derived Table
SELECT product_id, product_name, category_id, list_price
FROM oes.products p1
WHERE list_price = 
(
	SELECT MIN(list_price)
	FROM oes.products p2
	WHERE p2.category_id = p1.category_id
);

-- OR
SELECT product_id, product_name, category_id, list_price
FROM oes.products
WHERE list_price = 
(
	SELECT MIN(list_price)
	FROM oes.products 
);

-- OR -- using TOP
SELECT
	TOP(1) WITH TIES
	product_id,
	product_name,
	list_price,
	category_id
FROM oes.products
ORDER BY list_price ASC;


-- **BELOW IS A SOLUTION TO SECOND CHALLANGE**

SELECT * FROM oes.products;

-- GROUP BY
SELECT category_id, MIN(list_price)
FROM oes.products
GROUP BY category_id

-- Derived Table

SELECT p.product_id, p.product_name, p.list_price, p.category_id
FROM 
(
	SELECT 
		product_id,
		product_name,
		category_id,
		list_price,
		RANK() OVER (PARTITION BY category_id ORDER BY list_price ASC) AS price_rank
	FROM oes.products
) p
WHERE p.price_rank = 1
ORDER BY category_id;

-- Another take:
SELECT p.product_id, p.product_name, p.list_price, p.category_id
FROM oes.products p
WHERE p.list_price = (
						SELECT MIN(p2.list_price)
						FROM oes.products p2
						WHERE p2.category_id = p.category_id
					 );


-- Common Table Expression -- Solution to **FOURTH CHALLANGE**

WITH p
AS
(
	SELECT 
		product_id,
		product_name,
		category_id,
		list_price,
		RANK() OVER (PARTITION BY category_id ORDER BY list_price DESC) AS price_rank
	FROM oes.products
)
SELECT p.product_id, p.product_name, p.list_price, p.category_id
FROM p
WHERE p.price_rank = 1;



-- Second Challange
--Use a correlated subquery to return the following
--product details for the cheapest product(s) in each
--product category as given by the category_id column:
--- product_id
--- product_name
--- list_price
--- category_id
SELECT * FROM oes.products;

-- SOLUTION ABOVE IN FIRST CHALLANGE


-- Third Challange
--Return the same result as challenge 2 i.e. the cheapest
--product(s) in each product category except this time by
--using an inner join to a derived table.

-- Common Table Expression

WITH grouped
AS
(
	SELECT category_id, MIN(list_price) AS min_cat_price
	FROM oes.products
	GROUP BY category_id
)
SELECT p.product_id, p.product_name, grpd.category_id, p.list_price
FROM oes.products p
INNER JOIN grouped grpd
ON p.category_id = grpd.category_id
AND p.list_price = grpd.min_cat_price;

-- Derived Table
SELECT p1.product_id, p1.product_name, p1.list_price, p1.category_id
FROM oes.products p1
INNER JOIN
(
	SELECT category_id, MIN(list_price) AS min_cat_price
	FROM oes.products
	GROUP BY category_id
) p2
ON p1.category_id = p2.category_id
AND p1.list_price = p2.min_cat_price;


-- Fifth Challange
--Repeat challenge 4, except this time include the product
--category name as given in the oes.product_categories
--table.

WITH p
AS
(
	SELECT 
		product_id,
		product_name,
		category_id,
		list_price,
		RANK() OVER (PARTITION BY category_id ORDER BY list_price ASC) AS price_rank
	FROM oes.products
)
SELECT p.product_id, p.product_name, p.list_price, p.category_id, pc.category_name
FROM p INNER JOIN oes.product_categories pc
ON p.category_id = pc.category_id
WHERE p.price_rank = 1;


-- Sixth Challange

--Background:
--The employee_id column in the oes.orders table gives the
--employee_id of the salesperson who made the sale.
--Challenge:
--Use the NOT IN operator to return all employees who have
--never been the salesperson for any customer order. Include the
--following columns from hcm.employees:
--- employee_id
--- first_name
--- last_name
SELECT * FROM hcm.employees;
SELECT * FROM oes.orders;

-- First Approach -- **SEVENTH CHALLANGE**
SELECT e.employee_id, e.first_name, e.last_name
FROM hcm.employees e
WHERE NOT EXISTS 
(
	SELECT *
	FROM oes.orders oo
	WHERE e.employee_id = oo.employee_id
);

-- Second Approach
SELECT employee_id, first_name, last_name
FROM hcm.employees 
WHERE employee_id NOT IN
(
	SELECT employee_id
	FROM oes.orders 
	WHERE employee_id IS NOT NULL
);



-- Eighth Challange
--Return unique customers who have ordered the 'PBX Smart
--Watch 4’. Include:
--- customer_id
--- first_name
--- last_name
--- email
SELECT * FROM oes.products;
SELECT * FROM oes.customers;

-- * Bad example
--WITH orders_order_items
--AS
--(
--SELECT oo.customer_id, ooi.product_id, ooi.order_id
--FROM oes.orders oo INNER JOIN oes.order_items ooi
--ON oo.order_id = ooi.order_id
--),
--product_items
--AS
--(
--SELECT ooi2.product_id, op.product_name, ooi2.order_id
--FROM orders_order_items ooi2 INNER JOIN oes.products op
--ON op.product_id = ooi2.product_id
--)


-- The result of the query below doesn't return unique customer data
WITH order_product_items
AS
(
SELECT op.product_id, op.product_name, oo.customer_id
FROM oes.products op
INNER JOIN oes.order_items ooi
ON op.product_id = ooi.product_id
INNER JOIN oes.orders oo
ON ooi.order_id = oo.order_id
)
SELECT ooi.product_name, ooi.customer_id, oc.first_name, oc.last_name, oc.email
FROM order_product_items ooi INNER JOIN oes.customers oc
ON ooi.customer_id = oc.customer_id
WHERE ooi.product_name = 'PBX Smart Watch 4'
ORDER BY customer_id ASC;

-- Still returns not-unique customer values
WITH order_product_items
AS
(
	SELECT op.product_id, op.product_name, oo.customer_id
	FROM oes.products op
	INNER JOIN oes.order_items ooi
	ON op.product_id = ooi.product_id
	INNER JOIN oes.orders oo
	ON ooi.order_id = oo.order_id
)
SELECT ooi.product_name, ooi.customer_id, oc.first_name, oc.last_name, oc.email
FROM order_product_items ooi INNER JOIN oes.customers oc
ON ooi.customer_id = oc.customer_id
WHERE ooi.product_name IN (
							SELECT product_name
							FROM oes.products
							WHERE product_name = 'PBX Smart Watch 4'
						  )
ORDER BY ooi.customer_id ASC;

-- another approach (correct solution)
SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email
FROM oes.customers c
WHERE c.customer_id IN ( -- IN causes a return of unique values
							SELECT
								o.customer_id
							FROM oes.orders o
							JOIN oes.order_items oi
							ON oi.order_id = o.order_id
							JOIN oes.products p
							ON p.product_id = oi.product_id
							WHERE p.product_name = 'PBX Smart Watch 4'
							--ORDER BY o.customer_id ASC
					   )
ORDER by c.customer_id ASC;




--SELECT *
--FROM order_product_items ooi
--WHERE ooi.customer_id IN (
--							SELECT *
--							FROM oes.customers
--							WHERE customer_id IS NOT NULL
--						 )
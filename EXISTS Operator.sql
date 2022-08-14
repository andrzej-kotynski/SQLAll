/*EXISTS Operator
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24291786#content

EXISTS vs IN
* EXISTS is good (faster) for large query results
* otherwise IN is ok

Task:
Return all products that have been ordered as given in the order_details
table. (Return products where the product id exists in the order_details table.)

SELECT p.product_id, p.category, p.price
FROM products p
WHERE EXISTS
(
	SELECT *
	FROM order_details o
	WHERE o.product_id = p.product_id
);

The same can be also achieved by:

SELECT product_id, category, price
FROM products
WHERE product_id IN
(
	SELECT product_id
	FROM order_details
);

*/
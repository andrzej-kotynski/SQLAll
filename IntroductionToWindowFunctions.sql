/*Introduction to Window Functions
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24291908#content


Types of Functions:
	* Single row functions (and operations) - operate on a single row at a time 
	  and returns one output per row.
	* Aggregate functions - operate on multiple rows at a time and returns
	  a single value per group of rows.
	* Window functions - operate on multiple rows at a time, but returns
	  one output per row.



Task:
Return all products which have the highest price for their product category.

SELECT product_id, category, price
FROM products p1
WHERE price =
(
	SELECT MAX(price)
	FROM products p2
	WHERE p2.category = p1.category
);

Same as above, but through JOIN:

SELECT p1.product_id, p1.category, p1.price
FROM products p1
INNER JOIN
(
	SELECT category, MAX(price) AS max_cat_price
	FROM products
	GROUP BY category
) p2
ON p1.category = p2.category
AND p1.price = p2.max_cat_price;

Same as above using Window Function:

SELECT s.*
FROM
(
	SELECT
		product_id,
		category,
		price,
		RANK() OVER (PARTITION BY category ORDER BY price DESC) AS rnk
	FROM products
) s
WHERE s.rnk = 1;

*/
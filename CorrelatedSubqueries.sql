/*Correlated Subqueries
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24291782#content

* Correlated subqueries - subquery references a 
  column from the table in the outer query.

* A correlated subquery depends on the outer query for its values 
  therefore you cannot simply run the subquery independently.

* A correlated subquery may be evaluated once for each row processed by the outer
  query.


* Task:
Return all products which have the highest price for their product category.

SELECT product_id, category, price
FROM products p1
WHERE price = 
(
	SELECT MAX(price)
	FROM products p2
	WHERE p2.category = p1.category
);

This can also be represented by a join query:

SELECT p1.product_id, p1.category, p1.price
FROM products p1
INNER JOIN (SELECT category, MAX(price) AS max_cat_price
			FROM products
			GROUP BY category) p2
ON p1.category = p2.category
AND p1.price = p2.max_cat_price;

*/
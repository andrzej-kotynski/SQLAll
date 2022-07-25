/* Cross Joins
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288760#content

SELECT s.store_id, s.store_location, p.product_id, p.product_name
FROM store s CROSS JOIN products p;

Another way to write CROSS JOIN query:

SELECT s.store_id, s.store_location, p.product_id, p.product_name
FROM store s, products p;
*/
/* Concatentation in SQL Server
 -- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24304578#content

 * Concatenation is a way to combine character strings end-to-end.
 (concatenation of 'snow' and 'ball' is 'snowball')


 * SQL Server provides two methods of concatenation:
	1. Using the + operator
	2. Using the CONCAT function.



* Returns NULL if the middle_name is NULL:
SELECT 
	customer_id,
	first_name,
	middle_name,
	last_name,
	first_name + ' ' + middle_name + ' ' + last_name AS full_name
FROM customers;


* Returns middle_name without a NULL, but with 2 spaces:
SELECT 
	customer_id,
	first_name,
	middle_name,
	last_name,
	first_name + ' ' + ISNULL(middle_name, '') + ' ' + last_name AS full_name
FROM customers;


* Returns middle_name without a NULL without additional spaces:
SELECT 
	customer_id,
	first_name,
	middle_name,
	last_name,
	CONCAT(first_name, ' ' + middle_name, ' ', last_name) AS full_name
FROM customers;
*/
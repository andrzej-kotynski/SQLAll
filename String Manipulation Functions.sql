/* String Manipulaton Functions
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24304590#content

* CHARINDEX Function Syntax:
CHARINDEX(substring, string, [start_position])

SELECT
	 customer_id,
	 customer_name,
	 CHARINDEX(' ', customer_name) AS index_position_of_space
FROM customers;


* LEFT Function Syntax:
LEFT(string, number_of_characters)

SELECT
	customer_id,
	customer_name,
	LEFT(customer_name, 2) AS first_two_characters
FROM customers;


* LEFT + CHARINDEX
SELECT
	customer_id,
	customer_name,
	LEFT(customer_name, CHARINDEX(' ', customer_name - 1) AS first_name
FROM customers;


* SUBSTRING Function Syntax:
SUBSTRING(string, start_position, length)

SELECT
	customer_id,
	customer_name,
	SUBSTRING(customer_name, 4, 5) AS SUB
	FROM customers;

SELECT
	customer_id,
	customer_name,
	SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name)) AS last_name
	FROM customers;
*/
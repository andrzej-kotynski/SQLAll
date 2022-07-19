USE SAMPLEDB
GO
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24396300#content
/*

* HAVING clause is used to filter groups
* WHERE clause filters rows whereas the HAVING clause filters groups 
  of rows
* HAVING clause is written after a GROUP BY clause
* Aggregate functions can be used in the HAVING clause

* SYNTAX:

SELECT
	column1,
	aggregate_function(column2)
FROM table_name
[WHERE conditions]
GROUP BY column1
HAVING condition;


* Task:
Return the owner count for properties which have more that one owner.

SELECT
	property_id,
	COUNT(*) AS owner_count
FROM property_owners
GROUP BY property_id
HAVING COUNT(*) > 1;

*/
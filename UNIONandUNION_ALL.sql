/* UNION and UNION ALL
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288954#content

* UNION operator combines the output of two or more SELECT
statements into a single set of rows.

* UNION removes any duplicate rows that might result in the combined output.

SELECT column_name1, column_name2
FROM table_name1
UNION
SELECT column_name1, column_name2
FROM table_name2;

* Rules for set operators (UNION, UNION ALL, INTERSECT, EXCEPT):
	-- each SELECT statement must return the same number of columns
	-- the corresponding columns in each SELECT statement must have data types
	   that belong to the same data type group
*/
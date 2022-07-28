/* INTERSECT
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288964#content

* INTERSECT operator returns distinct rows that are in common to two or more sets

SELECT column_name1, column_name2
FROM table_name1
INTERSECT
SELECT column_name1, column_name2
FROM table_name2;

INTERSECT statement evaluates NULL as TRUE

*/
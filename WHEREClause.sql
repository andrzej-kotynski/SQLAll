--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24155806#content

USE SAMPLEDB
GO

/*

* null represents the absence of data, 
  is not a character string, blank space or a zero
* null does not equal another null, i.e. null<>null


*syntax that displays all the rows WITH 'Texas' value in
 a state column:

SELECT supplier_id, state, city
FROM suppliers			--suppliers is a table
WHERE state = 'Texas';  --state is a column


*syntax that displays all the rows WITHOUT 'Texas' value in
 a state column; NULL also is not displayed:

SELECT supplier_id, state, city
FROM suppliers			--suppliers is a table
WHERE state <> 'Texas';  --state is a column


*syntax that displays all the rows WITHOUT 'Texas' value in
 a state column; NULL is displayed:

SELECT supplier_id, state, city
FROM suppliers			--suppliers is a table
WHERE state <> 'Texas'  --state is a column
OR state IS NULL;


*syntax that displays all the rows WITH NULL:

SELECT supplier_id, state, city
FROM suppliers			--suppliers is a table
WHERE state IS NULL;

*/
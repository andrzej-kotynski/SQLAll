--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24069820#content

--there's no relevance to the order of the tuples(rows) in a set
--rows in SQL table conceptually have no definite order to them
--when oyu query a table do not expect the order to always be the same
--as the same as it was the previous time you queried the table
--ORDER BY is used to order a table by particular column or multiple columns
USE SAMPLEDB
GO

SELECT employee_id, first_name
FROM hcm.employees
ORDER BY employee_id DESC;

SELECT employee_id, first_name
FROM hcm.employees
ORDER BY 2; --order by a position of a column, first_name in this case

SELECT employee_id, first_name, hire_date
FROM hcm.employees
ORDER BY hire_date DESC, employee_id ASC; --first orders by the hire_date and if many employees are hired at the same time, they are sorted by first_name
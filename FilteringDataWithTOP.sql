--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24069866#content

USE SAMPLEDB
GO

SELECT order_id, customer_id, order_date
FROM oes.orders;

SELECT TOP (2) order_id, customer_id, order_date -- selects 2 top rows from the table
FROM oes.orders;

SELECT TOP (2) order_id, customer_id, order_date
FROM oes.orders
ORDER BY order_date DESC;

--WITH TIES includes all the same results - here it's order_date
SELECT TOP (2) WITH TIES order_id, customer_id, order_date
FROM oes.orders
ORDER BY order_date DESC;

--?? creates deterministic result, but it doesn't differ from
-- the lines 12-14
SELECT TOP (2) WITH TIES order_id, customer_id, order_date
FROM oes.orders
ORDER BY order_date DESC, order_id DESC;
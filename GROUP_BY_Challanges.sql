USE SAMPLEDB
GO
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24287788#content

-- First Challange
--Write query to give the total number of employees in
--each department as given by the department_id column
--in the hcm.employees table.

SELECT *
FROM hcm.employees

SELECT department_id, COUNT(*) AS total_count
FROM hcm.employees
GROUP BY department_id

--Second Challange
--Write a query to give the average salary in each
--department as given by the department_id column in the
--hcm.employees table. Order the query result by average
--salary from highest to lowest.

SELECT department_id, AVG(salary) AS average_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY average_salary DESC

--Third Challange
--Write a query to give the total number of products on
--hand at each warehouse as given by the warehouse_id
--column in the oes.inventories table. Also, limit the result
--to only warehouses which have greater than 5,000
--product items on hand.
SELECT *
FROM oes.inventories;

SELECT warehouse_id, SUM(quantity_on_hand) AS product_count
FROM oes.inventories
GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000

--Fourth Challange
--What is the date of the most recent population count at
--each locality in the bird.antarctic_populations table?

SELECT *
FROM bird.antarctic_populations

SELECT locality, MAX(date_of_count) AS most_recent_date
FROM bird.antarctic_populations
GROUP BY locality

--Fifth Challange
--What is the date of the most recent population count for each
--species at each locality in the bird.antarctic_populations
--table?

--SELECT *
--FROM bird.antarctic_populations

SELECT species_id, MAX(date_of_count) AS most_recent_date
FROM bird.antarctic_populations
GROUP BY species_id, locality

--OR

SELECT locality, species_id, MAX(date_of_count) AS most_recent_date
FROM bird.antarctic_populations
GROUP BY locality, species_id
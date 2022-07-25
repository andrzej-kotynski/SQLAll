/* Self-referencing Joins (Self Join)
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288754#content

Self-referencing joins:
-- useful for hierarchical data
-- comparing roles within the same table

SELECT	e.employee_id,
		e.first_name,
		e.job_title,
		e2.first_name AS manager_name,
		e2.job_title AS manager_title
FROM employees e INNER JOIN employees e2 -- the same table receives 2 different aliases
ON e.manager_id = e2.employee_id;

-- use LEFT JOIN to include all job_title records from employees table
*/
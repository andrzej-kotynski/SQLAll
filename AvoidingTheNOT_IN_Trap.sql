/* Avoiding the NOT IN Trap
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24293098#content

* Task 1:
  Write a query to return all the departments that currently have no employees.

ATTEMPT 1

SELECT *
FROM departments
WHERE department_id NOT IN (SELECT department_id
							FROM employees);

The query above doesn't return any rows, because:
	-- there's NULL in department_id column

The query above is the same as this:

SELECT *
FROM departments
WHERE department_id <> 101
  AND department_id <> 102
  AND department_id <> NULL;


ATTEMPT 2

SELECT *
FROM departments
WHERE department_id NOT IN (
							SELECT department_id
							FROM employees
							WHERE department_id IS NOT NULL
							);

Different approach:

SELECT *
FROM departments d
WHERE NOT EXISTS (
					SELECT *
					FROM employees e
					WHERE e.department_id = d.depratment_id
				 );

* Task 2:
  Write a query to give all the departments that currently have no employees.

SELECT d.department_name, e.department_id
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

*/
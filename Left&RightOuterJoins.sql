/* Left Outer Joins & Right Outer Joins
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288390#content



* Left Outer Join

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d LEFT OUTER JOIN employees e
ON d.dept_id = e.dept_id;

* OUTER keyword is optional

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d LEFT JOIN employees e
ON d.dept_id = e.dept_id;



* Right Outer Join

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM employees e RIGHT OUTER JOIN departments d
ON d.dept_id = e.dept_id;

It's best practice to prioritise usage of Left Outer Joins
*/ 
/* INNER JOINS
-https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288362#content

SELECT * 
FROM departments INNER JOIN employees
ON departments.dept_id = employees.dept_id;

* It's better to choose specific columns:

SELECT departments.dept_id, departments.dept_name, employees.emp_id, employes.first_name
FROM departments INNER JOIN employees
ON departments.dept_id = employees.dept_id;

* Or better yet use aliases instead of names:

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

* Also the INNER keyword is optional

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d JOIN employees e
ON d.dept_id = e.dept_id;

*/
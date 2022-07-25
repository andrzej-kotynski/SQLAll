USE SAMPLEDB
GO

--First Challenge

--Write a query to return employee details for all employees as
--well as the first and last name of each employee's manager.
--Include the following columns:
--- employee_id
--- first_name
--- last_name
--- manager_first_name (alias for first_name)
--- manager_last_name (alias for last_name)
SELECT *
FROM hcm.employees;

SELECT e.employee_id, 
	e.first_name, 
	e.last_name, 
	em.first_name AS manager_first_name,
	em.last_name AS manager_last_name
FROM hcm.employees e INNER JOIN hcm.employees em --wrong, apparently it's LEFT JOIN
ON e.manager_id = em.employee_id;

--Second Challenge

--Write a query to return all the products at each warehouse.
--Include the following attributes:
--- product_id
--- product_name
--- warehouse_id
--- warehouse_name
--- quantity_on_hand
SELECT * FROM oes.products;
SELECT * FROM oes.inventories;
SELECT * FROM oes.warehouses;

SELECT p.product_id, 
	p.product_name, 
	w.warehouse_id, 
	w.warehouse_name, 
	i.quantity_on_hand
FROM oes.products p
INNER JOIN oes.inventories i
ON p.product_id = i.product_id
INNER JOIN oes.warehouses w
ON i.warehouse_id = w.warehouse_id;

--Third Challenge

--Write a query to return the following attributes for all
--employees from Australia:
--- employee_id
--- first_name
--- last_name
--- department_name
--- job_title
--- state_province
SELECT * FROM hcm.employees;
SELECT * FROM hcm.departments;
SELECT * FROM hcm.jobs;
SELECT * FROM hcm.countries;
/*
employees -> departments through department_id
employees -> jobs through jobs_id
employees -> countries through country_id

*/
SELECT e.employee_id, 
	e.first_name, 
	e.last_name, 
	d.department_name, 
	j.job_title, 
	e.state_province,
	c.country_name
FROM hcm.employees e
INNER JOIN hcm.departments d -- it's supposed to be LEFT JOIN
ON e.department_id = d.department_id
INNER JOIN hcm.jobs j 
ON e.job_id = j.job_id
INNER JOIN hcm.countries c
ON e.country_id = c.country_id
WHERE c.country_name = 'Australia';
-- using only LEFT JOINS yields the same results

--Fourth Challange

--Return the total quantity ordered of each product in each
--category. Do not include products which have never
--been ordered. Include the product name and category
--name in the query. Order the results by category name
--from A to Z and then within each category name order
--by product name from A to Z.

/*
* oes.order_items - quantity
* oes.products - product_name
* oes.product_categories - category_name
* no NULLs!
* ORDER BY category_name ASC

*/

SELECT * FROM oes.products;
SELECT * FROM oes.product_categories;
SELECT * FROM oes.order_items;

SELECT p.product_name, 
	pc.category_name, 
	SUM(oi.quantity) AS product_quantity
FROM oes.products p
INNER JOIN oes.order_items oi
ON p.product_id = oi.product_id
INNER JOIN oes.product_categories pc
ON p.category_id = pc.category_id
GROUP BY p.product_name, pc.category_name
ORDER BY pc.category_name ASC, p.product_name ASC;

--Fifth Challenge

--Return the total quantity ordered of each product in each
--category. Include products which have never been
--ordered and give these a total quantity ordered of 0.
--Include the product name and category name in the
--query. Order the results by category name from A to Z
--and then within each category name order by product
--name from A to Z.
SELECT * FROM oes.products;
SELECT * FROM oes.product_categories;

/*
LEFT JOIN
replace NULL with the value of 0
ORDER BY category_name ASC, product_name ASC

*/
SELECT p.product_name, 
	pc.category_name, 
	ISNULL(SUM(oi.quantity), 0) AS product_quantity
FROM oes.products p
LEFT JOIN oes.order_items oi
ON p.product_id = oi.product_id
LEFT JOIN oes.product_categories pc
ON p.category_id = pc.category_id 
GROUP BY p.product_name, pc.category_name
ORDER BY pc.category_name ASC, p.product_name ASC; 
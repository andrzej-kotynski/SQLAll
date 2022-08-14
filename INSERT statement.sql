/*The INSERT Statement

Inserting values to the columns.
Syntax:
INSERT INTO table_name (column1, column2, ...)
	VALUES (col1_value, col2_value, ...);

Example:
INSERT INTO products (prod_name, unit_price, last_updated)
	VALUES ('A2 milk', 4.99, '20201127');

Multi-row INSERT Statement
INSERT INTO products (prod_name, unit_price, last_updated)
	VALUES	('A2 milk', 4.99, '20201127'),
			('Brown Rice', 3.99, '20201127'),
			('Instant Noodles', 1.79, '20201127'),
			('Baked Beans', 1.20, '20201127');


Inserting data that comes from another tables.
Syntax:
INSERT INTO table_name (column1, column2)
SELECT column1, column2
FROM table2_name;

Example:
INSERT INTO dbo.dept (dept_name, loc_id)
SELECT department_name, location_id
FROM hcm.departments
WHERE department_name = 'IT';
*/
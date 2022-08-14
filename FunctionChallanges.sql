USE SAMPLEDB
GO

-- First Challange
--Concatenate the first name and last name of each
--employee. Include a single space between the first and
--last name. Name the new expression employee_name.
--Include:
--- employee_id
--- first_name
--- last_name
--- employee_name

SELECT * FROM hcm.employees;

SELECT
	employee_id,
	first_name,
	last_name,
	CONCAT(first_name,' ', last_name) AS employee_name
FROM hcm.employees

-- Second Challange
--Concatenate the first name, middle name, and last name
--of each employee. Include a single space between each
--of the names. Name the new expression employee_name.
--Include:
--- employee_id
--- first_name
--- last_name
--- employee_name

SELECT
	employee_id,
	first_name,
	last_name,
	CONCAT(first_name,' ' + middle_name, ' ', last_name) AS employee_name
FROM hcm.employees

-- Third Challange
--Extract the genus name from the scientific_name as
--given in the bird.antarctic_species table.
--Phoebetria		fusca
--Genus Name		Species Name

SELECT * FROM bird.antarctic_species;

--???
SELECT 
	scientific_name,
	LEFT(scientific_name, CHARINDEX(' ', scientific_name) - 1) AS genus
FROM bird.antarctic_species;

-- Fourth Challange
--Extract the species name from the scientific_name as
--given in the bird.antarctic_species table.

SELECT 
	scientific_name,
	SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name)+1, LEN(scientific_name)) AS last_name
FROM bird.antarctic_species;

-- Fifth Challange
--Return the age in years for all employees. Name this
--expression as employee_age. Include:
--- employee_id
--- first_name
--- last_name
--- birth_date
--- employee_age

SELECT * FROM hcm.employees;

SELECT 
	employee_id, 
	first_name,
	last_name,
	birth_date,
	DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) AS employee_age
FROM hcm.employees;


-- Sixth Challange
--Assuming an estimated shipping date of 7 days after the
--order date, add a column expression called
--estimated_shipping_date for all unshipped orders.
--Include:
--- order_id
--- order_date
--- estimated_shipping_date

SELECT
	order_id,
	order_date,
	DATEADD(day, 7, order_date) AS estimated_shipping_date
FROM oes.orders;


-- Seventh Challange
--Calculate the average number of days it takes each
--shipping company to ship an order. Call this expression
--avg_shipping_days. Include:
--- company_name
--- avg_shipping_days

SELECT * FROM oes.shippers;
SELECT * FROM oes.orders;

SELECT os.company_name, AVG(DATEDIFF(day, oo.order_date, oo.shipped_date)) AS avg_shipping_days
FROM oes.shippers os
JOIN oes.orders oo
ON os.shipper_id = oo.shipper_id
GROUP BY os.company_name;
USE SAMPLEDB
GO

/* Collation
Collation is a set of rules dictating how each group of characters
within SQL Server are treated.
Collation can be set:
	* at the server level
	* database level
	* column level

Task: 
Write a query to return products 
called 'usb hub'.

SELECT
	product_id,
	product_name
FROM products
WHERE product_name = 'usb hub'; -- case insensitive collation

The collation for product_name column is:
Latin1_General_CI_AS
Where:
	* CI is Case Insensitive
	* AS is Accent Sensitive -- accented letter has a dash above it ex. 'á'
Accent Sensitive -> 'á' != 'a'

*/

-- querying a system view called columns in the information schema
-- the information schema has a series of system views and
-- is one of several methods that SQL Server provides for obtaining metadata

-- here we're getting metadata information about the columns in the 
-- products table

SELECT 
	TABLE_SCHEMA,
	TABLE_SCHEMA,
	COLUMN_NAME,
	DATA_TYPE,
	COLLATION_NAME
FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'products';--doesn't work lol

/*
Continuation of the task:
Write a query to return products 
called 'usb hub' i.e.:
	'USB' is all upper case
	'hub' is all lower case

The goal is to change the collation within the querry, not the actual table

SELECT
	product_id,
	product_name
FROM products
WHERE product_name = 'USB hub'
	COLLATE Latin1_General_CS_AS;
*/

/* Pattern Matching

Task:
Return products which contain the word 'tablet'
anywhere within the product name.

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '%tablet%';
-- returns all the rows that contain the word 'tablet'
% sign means the same thing as * sign in OTRS Search

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE 'tablet%';
-- returns all the rows that start with the word 'tablet'

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '%tablet';
-- returns all the rows that end with the word 'tablet'

*/
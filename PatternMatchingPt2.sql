USE SAMPLEDB
GO

/*

* Task:
Return products where the second character in the product
name is the letter 'X'.

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '_X%' -- _ means single character wildcard


* Task:
Return products which contain 
the character string 'used_tablet'.
-- here SQL will interpret _ sign as a single character wildcard, not 
a part of the string's name

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '%used!_tablet%'
ESCAPE '!'; --any character can be used

* Task
Return products where the first
character is a number.

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '[0-9]%';

* Task:
Return products where the first character
is a letter, and the second character is a number.

SELECT
	product_id,
	product_name
FROM products
WHERE product_name LIKE '[A-Z][0-9]%'

*/
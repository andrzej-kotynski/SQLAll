/*DELETE Statement

Syntax:
DELETE FROM table_name
[WHERE conditions];


Example that deletes all rows with product_name of 'Sports hat':
DELETE FROM dbo.products
WHERE product_name = 'Sports hat';

Example that deletes all rows from the products table:
DELETE FROM dbo.products;

Another way to delete all the rows in a table is to use a TRUNCATE TABLE
statement.
*/


DELETE FROM dbo.emp
WHERE emp_id = 1;

SELECT * FROM dbo.emp;
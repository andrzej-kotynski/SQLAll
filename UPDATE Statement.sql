/*UPDATE Statement

Syntax:
UPDATE table_name
SET column1 = value1,
	column2 = volue2,
	...
[WHERE conditions];

Example 1:
UPDATE products
SET price = 5.5
WHERE product_name = 'Sports hat';

Example 2:
UPDATE products
SET price = price * 1.1
WHERE product_name = 'Sports hat';

UPDATE products
SET price = price * 1.1,
	category_name = 'Clothing';
WHERE product_name = 'Sports hat';
*/

UPDATE dbo.emp
SET last_name = 'Greenbank'
WHERE emp_id = 2;

SELECT * FROM dbo.emp;
/*UNIQUE Constraints

* UNIQUE is a type of integrity constraint

* UNIQUE constraint ensures that the column specified in the constraint can only
have unique values.

* If multiple columns are specified in the constraint, then only unique combinations
of the column values are allowed.

* UNIQUE constraint is similar to a PRIMARY KEY constraint.

Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name UNIQUE (column_name);

Example:
ALTER TABLE dbo.products
ADD CONSTRAINT uk_products_product_name UNIQUE (product_name);
*/

--Challange:
--Use an ALTER TABLE statement to add a UNIQUE constraint to the
--department_name column in the hcm.departments table.
USE SAMPLEDB
GO

SELECT * FROM hcm.departments;

ALTER TABLE hcm.departments
ADD CONSTRAINT uk_departments_department_name UNIQUE (department_name);
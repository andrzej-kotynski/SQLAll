/*CHECK Constraint

* CHECK constraint - type of integrity constraint
* CHECK constraint - is applied to a column and checks that each value in the
column meets a certain condition.
* CHECK constraint cannot refer to a column from another table.
* CHECK constraint cannot contain a subquery. 

Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name condition);

Example:
ALTER TABLE dbo.order_details
ADD CONSTRAINT chk_order_details_quantity CHECK (quantity > 0);

The CHECK constraint above ensures that the column called quantity will always
have a value greater than zero.
*/

--Challange:
--Use an ALTER TABLE statement to add a CHECK constraint on the salary column in the
--hcm.employees table to ensure that salary is greater than or equal to zero.

USE SAMPLEDB
GO

ALTER TABLE hcm.employees
ADD CONSTRAINT chk_employees_salary CHECK (salary >= 0);
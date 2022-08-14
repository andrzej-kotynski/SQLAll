/*ALTER TABLE Challanges*/
USE SAMPLEDB
GO

--First Challange
--Add a new column called ‘termination_date’ onto the
--hcm.employees table. Give this new column a data type of
--DATE.

ALTER TABLE hcm.employees
ADD termination_date DATE;

SELECT * FROM hcm.employees;

--Second Challange
--Write two SQL statements to change the data type of the
--first_name and last_name columns to NVARCHAR(60) in the
--oes.customers table.

ALTER TABLE oes.customers
ALTER COLUMN first_name NVARCHAR(60);

ALTER TABLE oes.customers
ALTER COLUMN last_name NVARCHAR(60);

--Third Challange
--Use sp_rename to rename the column name 'phone' to
--'main_phone' in the oes.customers table. Note that this
--challenge does not use an ALTER TABLE statement.

sp_rename 'oes.customers.phone','main_phone','COLUMN';
SELECT * FROM oes.customers;
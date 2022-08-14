/*CREATE TABLE Challanges */
USE SAMPLEDB
GO

--First Challange
--Create a table called dept in the dbo schema. Specify the
--following columns:
--- dept_id INT
--- dept_name VARCHAR(50)
--Give the IDENTITY property to the dept_id column. Also,
--put a primary key constraint on the dept_id column. Put
--a NOT NULL constraint on the dept_name column.
CREATE TABLE dept
(
dept_id INT IDENTITY(1,1),
dept_name VARCHAR(50) NOT NULL,
CONSTRAINT PK_dept_dept_id PRIMARY KEY (dept_id)
);

SELECT * FROM dbo.dept;
--Second Challange
--Write an insert statement to insert the following row into
--the dbo.dept table:
INSERT INTO dept (dept_name)
	VALUES ('Business Intelligence');

--Third Challange
--Populate the dbo.dept table with more rows: Insert all
--department names from the hcm.departments table.
INSERT INTO dbo.dept (dept_name)
SELECT department_name
FROM hcm.departments;

--Fourth Challange
--Create a table called emp in the dbo schema. Specify the following
--columns:
--- emp_id INT
--- first_name VARCHAR(50)
--- last_name VARCHAR(50)
--- hire_date DATE
--- dept_id INT
--Give the IDENTITY property to the emp_id column. Also, put a primary
--key constraint on the emp_id column. Put NOT NULL constraints on
--any columns you think need them. Put a foreign key constraint on
--the dept_id column which references back to the dept_id column
--from the dbo.dept table.

CREATE TABLE dbo.emp
(
	emp_id INT IDENTITY(1,1),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	hire_name DATE,
	dept_id INT,
	CONSTRAINT PK_emp_emp_id PRIMARY KEY (emp_id),
	CONSTRAINT FK_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dbo.dept (dept_id)
);

--Fifth Challange
--Populate the dbo.emp table with the following two
--employees:
INSERT INTO dbo.emp (first_name, last_name, hire_name, dept_id)
	VALUES	('Scott', 'Davis', '20201211', 1),
			('Miriam', 'Yardley', '20201205', 1);

SELECT * FROM dbo.emp;
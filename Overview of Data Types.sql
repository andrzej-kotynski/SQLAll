/*Overview of Data Types
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24304746#content


* The main classes of data types in SQL Server are:
	
	-- Character:
		- VARCHAR(n)
		- CHAR(n)
		- NVARCHAR(n)
		- NCHAR(n)
	
	-- Numeric:
		- INT
		- DECIMAL
		- FLOAT

	-- Date and time-related:
		- DATE
		- TIME
		- DATETIME2


* When we create a table, we need to specify the data type of each column.
A data type constrains what kind of data a column can hold.

CREATE TABLE employees
(
	employee_id	INT,
	first_name	NVARCHAR(100),
	last_name	NVARCHAR(100),
	salary		DECIMAL(12, 2),
	hire_date	DATE
);


* Fixed size characeter strings like CHAR(n) - if the inserted character string
is shorter than value n, then SQL Server willpad the string with black spaces.


BIT Data Type - is an INT data type that takes the value of 1, 0, NULL
it's used kind of like BOOL

DECIMAL(p,s)	- where p is total digits and s number of digits after the decimal poin
				- p stands for precision - it includes the digit on both sides of the decimal point
				- s stands for scale

DECIMAL data type is the same as NUMERIC data type

FLOAT(n)		- where n is the number of bits that are used to store the float number, default is 53bits
				- float is good for applications that account for a certain margin of error
				- it's horrible for banking
*/
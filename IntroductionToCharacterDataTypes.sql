USE SAMPLEDB
GO

/*

Data type			Description

varchar(n)			Variable-size string data.
nvarchar(n)			Variable-size string data. Stores data as Unicode.
char(n)				Fixed-size string data.
nchar(n)			Fixed-size string data. Stores data as Unicode.

where (n) means maximum string size
Unicode - multiple languages are supported



* Task:
Display metadata about the data types of the table.

SELECT
	table_name,
	column_name,
	data_type,
	character_maximum_length AS char_max_length,
	character_octet_length AS char_octet_length
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'dbo'
AND table_name = 'customers';

* Task:
Return all customers with the first name Joanna

SELECT
	customer_id,
	first_name
FROM customers
WHERE first_name = 'Joanna'; -- SQL engine implicitly converts character
								string 'Joanna' into nvarchar() data type
								so it can be compared to the first_name
								column.
								That being said it's best to use 
								explicit type conversion due to performance
								impact.

								
* Example of explicit type conversion:

SELECT
	customer_id,
	first_name
FROM customers
WHERE first_name = N'Joanna'; -- N means unicode varchar string
*/
/* ALTER TABLE Statement and sp_rename

* ALTER TABLE is used to add, modify or drop columns in an existing table.

In SQL term 'drop' means deleting an object such as a table, column etc.
While 'delete' refers only to deleting a row.

* Add a column to a table Syntax:

ALTER TABLE table_name
ADD column_name column_data_type;

Example:
ALTER TABLE dbo.products
ADD product_code INT;

Added column always appears at the end of the table.
In order to change the column order of the table it's necessary to drop the whole
table and recreate it from the scratch.

* Add multiple columns to a table Syntax:
ALTER TABLE table_name
ADD column_name1 column1_data_type,
	column_name2 column2_data_type;

Example:
ALTER TABLE dbo.products
ADD product_code INT
	date_added DATETIME2,
	notes VARCHAR(100);

* Modifying an exisiting column Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name column_data_type;

Example:
ALTER TABLE dbo.products
ALTER COLUMN product_name VARCHAR(50) NOT NULL;

* Drop a column in a table Syntax:
ALTER TABLE table_name
DROP COLUMN column_name;

Example:
ALTER TABLE dbo.products
DROP COLUMN color;

* Rename a column in a table Syntax:
sp_rename 'schema_name.table_name.old_column_name','new_column_name','COLUMN';

Example:
sp_rename 'dbo.products.product_name','prod_name','COLUMN';

Beware that changing a column name can break scripts, stored procedures and views
that are still referncing the old column name.
sp_rename can also be used to rename other types of objects. However, it is not
recommended to use sp_rename for some types of objects, such as stored procedures
and views. This is because there are some metadata system views which store the
object code and these will not be updated.
*/

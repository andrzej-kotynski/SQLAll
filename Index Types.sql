/*Index Types

* Non-clustered Indexes
	- regular b+ tree index
	- stored at a different place to the table data
	- contains pointers to the location of data, which allows for multiple
	  non-clustered indexes on a single table
	
Syntax:
CREATE NONCLUSTERED INDEX index_name
	ON table_name (column1_name, column2_name,...);

Example:
CREATE INDEX ix_accounts_account_name ON dbo.accounts (account_name);


* Clustered Indexes
	- physically sorts the table data according to the indexes column(s)
	- table data can be sorted in only one way; therefore we can only create one
	  clustered index per table
	- by default a primary key constraint will also create a clustered index on
	  the primary key column; for example:
			ALTER TABLE dbo.accounts ADD CONSTRAINT pk_account_accoun_id
			PRIMARY KEY CLUSTERED (account_id);

	- if required it is possible to create a clustered index by itself on a column
	  that is not the primary key; for example:
			CREATE CLUSTERED INDEX ix_employee_login_id ON dbo.employees (login_id);


* Unique Indexes
    - ensures that a column can only contain unique values
	- by default in SQL Server
		- when either a unique constraint or primary key constraint is created,
		then a corresponding unique index is also created
		- a unique constraint will automatically create a corresponding 
		non-clustered index
		- a primary key constraint will automatically create a corresponding 
		clustered index
	- a unique index can also be created by itself

Syntax:
CREATE UNIQUE INDEX index_name
	ON table_name (column1_name, column2_name,...)


* Filtered Index
Syntax:
CREATE INDEX index_name
	ON table_name (column1_name, column2_name,...)
WHERE condition;

Example:
CREATE INDEX ix_employees_termination_date
	ON hcm.employees (termination_date)
WHERE termination_date IS NULL;



* Composite Index
	- multiple columns are specified for the index key
Example:
CREATE INDEX ix_customers_last_name_first_name ON customers
(first_name, last_name);

* Indexes with Included Columns
Syntax:
CREATE NONCLUSTERED INDEX index_name ON table_name (col1, col2,...) -- index key columns
INCLUDE (col3, col4,...); --non-key columns
*/

/*Views

* View - a virtual table whose data is defined by a query

Syntax:

CREATE VIEW name_of_view AS
SELECT col1, col2
FROM table_name;

* Like a table, a view consists of named columns and rows of data

* Unlike a table, a view has no physical representation:
	- Data in a view is not stored on a disk; instead a view typically queries
	base tables

* A view fetches data from underlying tables when we query the view.

* View Characteristics:
	- every column in a view myst have a name
	- ORDER BY cannot be used in a view unless TOP i also specified
		-- do not use SELECT TOP 100 PERCENT.. ORDER BY.. as a workaround;
		this will not guarantee the ordering of rows in a view
	- you can modify base table data through a simple view.

* Uses:
	- providing security i.e. limit access
		-- users can have access to views that select only a subset of columns from
		a table
	- simplifying a data model
		-- e.g. you could have a view which has a complex SELECT statement which
		joins multiple tables and/or aggregates data; users can then query the
		custom-made view to simplify reporting queries
*/
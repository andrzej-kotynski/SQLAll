/*Indexes

* An index is a data structure which can speed up searches on a table if properly
implemented.
* And index can be applied to one or more columns in a table.
* Indexes are a separate data structure to the table on which they are applied.
* Indexes take up storage.
* Index can slow down insert, update and delete statements, because the index
also needs to be updated.


* Book-Index Analogy:
	* An index in a database can be likened to an index in a book.
	* A book index helps you to quickly find what page to find some topic.
	* A book index copies a small piece of information (i.e. a topic) and then
	  orders it alphabetically.
	* Each topic has a reference to one or more page numbers in the book.
	* An index in a database references locations in a table, rather than pages
	  in a book.

* Terminology:

	Heap - table that does not have a clustered index on it
	Table scan - reading of all the rows and columns performed by the SQL engine
	Index scan - reading of all the rows (or index pages) and only the columns
				 in the index 
	Index seek - pinpointing only the rows that are needed to satisfy the query
	Cardinality - number of unique values in a column
	Selectivity - measure of how much an index can help to narrow the search
				  for specific values in a table.
				  There are two ways it can be expressed:
						* Average Selectivity - cardinality divided by the total
						  number of rows in a table.
						* Selectivity of a specific value - number of rows for a 
						  specific value divided by the total number of rows in a
						  table.


Cardinality:
SELECT
	COUNT(DISTINCT(order_status)) AS cardinality
FROM dbo.orders;

Avg. Selectivity:
SELECT
	(COUNT(DISTINCT(order_status)) * 1.0 / COUNT(*)) AS avg_selectivity
FROM dbo.orders;

Selectivity of a specific value:
SELECT
	(SELECT COUNT(*) FROM orders WHERE order_status = 'Closed') * 1.0 / COUNT(*)
	AS selectivity_for_value_closed
FROM orders;


* Implications of Selectivity
	- when average selectivity is low for a column, then it is often best not to
	index that column

*/
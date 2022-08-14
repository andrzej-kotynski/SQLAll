/*Sargable Queries

* Sargable Query - SQL engine takes full advantage of an index to make a query
execute faster

* Sargable = search + argument + able

* Search argument - a filter condition that enables the query optimizer to use 
index order.


* A condition in the WHERE clause is sargable if:
	- No manipulation is applied to the column that is being filtered on
	- The comparison operator identifiers a consecutive range of rows that are
	indexed. This is true for operators such as =, >, >=, <, <=, BETWEEN, LIKE
	without a leading % sign wildcard.


-- Select all Salespeople with names starting with 'A':
SELECT person_id, first_name
FROM dbo.salespeople
WHERE LEFT(first_name, 1) = 'A';

The query above is not sargable, because we have 'manipulated' the first_name column
by applying the LEFT function to it.

Sargable example:

SELECT person_id, first_name
FROM dbo.salespeople
WHERE first_name LIKE 'A%';

The query above is sargable, because the condition the WHERE clause can 
successfully identify a consecutive range of indexed rows i.e. the ones starting 
with the letter 'A'.


-- Select all Salespeople with names ending with 'a':
SELECT person_id, first_name
FROM dbo.salespeople
WHERE first_name LIKE '%a';

The query above is not sargable, because the WHERE clause cannot successfully
identify a consecutive range of indexed rows i.e. the ones ending with the
letter 'A';


*/
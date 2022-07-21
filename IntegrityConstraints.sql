/* Integrity Constraints
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288406#content

* Data Integrity refers to the accuracy and consistency of data.
* In Relational Databases we can enforce data integrity by adding constraints on
  columns in a table.
* Common types of data integrity constraints are:
	- PRIMARY KEY
	- FOREIGN KEY
	- NOT NULL
	- UNIQUE
	- CHECK


* Primary Key Constraint

	A primary key constraint is placed on a column or set of columns. 
	This constraint ensures that the values in the primary key column(s) 
	are both unique and not null.

	A single table might have many potential (candidate) keys but only one 
	candidate key is selected to have a primary key constraint placed on it.

	Candidate key is a column or combination of columns which has unique values.

	A table can only have one primary key constraint.


* Foreign Key Constraint

	Foreign keys are used to enforce referential integrity between tables.

	In a one-to-many relationship, the foreign key constraint is placed on the
	child table (many side).

	The vales of a foreign key column uniquely identify a row of another 
	table or the same table (self-referencing foreign key). 

	The foreign key usually refers to the primary key in another table.

	A column with a foreign key on it will only have values that first exist in
	the primary key column of the table that it references.

	Foreign key column can have NULLs, but this can be mitigated by placing a
	not-NULL constraint on the said column.

* Primary Key Constraint vs. Unique Constraint:
	- Unique Constraint allows the NULL
	- a table can have only one Primary Key, but multiple Unique Constraints
*/
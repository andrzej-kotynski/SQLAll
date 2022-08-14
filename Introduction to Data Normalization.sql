/*Introduction to Data Normalization

Data Normalization - process of organizing attributes (columns) into tables
to minimise data redundancy i.e. unnecessary duplication of data

Data normalization typically involves breaking larger tables into smaller
(less redundant) tables and defining relationships between them.

Reasons to normalize data:
-- eliminates the potential for update, insertion and deletion anomalies to occur
-- reduces the need for restructuring data as new types of data are introduced
to the database
-- makes the data more informative to users

Update Anomalies:
	-- occur when one or more instances of duplicated data is updated, but not 
	all of it is
	-- also known as 'modification anomalies'

Insertion Anomalies:
	-- occurs when particular attributes cannot be inserted into a table without
	other attributes also being present
	-- occurs when you are prevented from inserting data into a table as you do
	not have a 'complete' key value

Deletion Anomalies:
	-- occurs when certain attributes are lost because of the deletion of other
	attributes
*/
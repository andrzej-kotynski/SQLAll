/*Stored Procedures

* A stored procedure is simply some SQL code that is saved in the database which
can be executed.

* When a stored procedure is executed, the SQL statements contained within the 
procedure are executed.

* Often, stored procedures will contain a batch of SQL statements which are treated
as a logical unit.

* A stored procedure can be defined to accept input and output parameters.

*Syntax:
CREATE PROCEDURE schema_name.proc_name
(@parameter1 data_type, @parameter2 data_type)
AS

sql_statements...

;

or

CREATE PROCEDURE schema_name.proc_name
(@parameter1 data_type, @parameter2 data_type)
AS
BEGIN

sql_statements...

END;

*Explicit Transaction Syntax:
CREATE PROCEDURE schema_name.proc_name
(@parameter1 data_type, @parameter2 data_type)
AS
BEGIN TRANSACTION

sql_statements...

END TRANSACTION;

*Executing a Stored Procedure Syntax:
EXECUTE proc_name
	@param1 = param1_value,
	@param2 = param2_value;
*/
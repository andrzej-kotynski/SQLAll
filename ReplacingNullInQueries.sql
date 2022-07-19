USE SAMPLEDB
GO


-- assume that bonus column contains null

--SELECT 
--	employee_id, 
--	first_name, 
--	salary, 
--	bonus,
--	salary + bonus AS total_amount -- if bonus is NULL the result is also NULL
--FROM hcm.employees;

--SELECT 
--	employee_id, 
--	first_name, 
--	salary, 
--	bonus,
--	salary + ISNULL(bonus, 0) AS total_amount -- here we asign value 0 for null
--FROM hcm.employees;

--ISNULL() Function Syntax:
--ISNULL(expression, alternative_value)

--SELECT 
--	employee_id, 
--	first_name, 
--	salary, 
--	bonus,
--	salary + COALESCE(bonus, 0) AS total_amount -- COALESCE can also be used to substitute NULL with something else
--FROM hcm.employees;

--COALESCE() Function Syntax:
--COALESCE(expression1, expression2, ... expression_n) -- function returns the value of the first non-null expression for each row


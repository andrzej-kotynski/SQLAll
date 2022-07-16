--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24067936#content

--SELECT DISTINCT clause is used to remove duplicates from the result
--of a SELECT statement

--if only one column is provided, SELECT DISTINCT provides the unique
--values in that column

--if many columns are priovided, SELECT DISTINCT provides unique combinations
--of values for the specified columns

--nulls are treated as a distinct value by the SELECT DISTINCT clause

--Syntax:
--SELECT DISTINCT column1, column2...
--FROM table1;
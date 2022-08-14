/* Self-contained Subqueries*/
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24289804#content

USE AdventureWorks2019
GO

SELECT * FROM [Production].[Product];

SELECT [Name], [ProductNumber], [Weight]
FROM Production.Product
WHERE [Weight] = (
				  SELECT MAX([Weight])
				  FROM Production.Product
				 );
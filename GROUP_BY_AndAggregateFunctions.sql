USE SAMPLEDB
GO
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24173328#content

/*

* Task:
Write a query to get the total area in square meters for properties 
within each property zone category

SELECT
	prop_zone,
	SUM(area_sqm) AS total_area_sqm
FROM properties
GROUP BY prop_zone;  -- this gets processed before the SELECT
						the result is a separate sum for 
						one group and separate for another

* Task:
Group by the column occupied and count all its values (groups?)

SELECT
	occupied,
	COUNT(*) AS total_count
FROM properties
GROUP BY occupied;

* Task:
Group by the column occupied and count all its values and 
only occupied values

SELECT
	occupied,
	COUNT(*) AS total_count
	COUNT(occupied) AS occupied_count -- it doesn't count NULLs
FROM properties
GROUP BY occupied;

* Task: 
Group by prop_zone column and occupied column and sum up the area_sqm
within each group

SELECT
	prop_zone,
	occupied,
	SUM(area_sqm) AS total_area_sqm
FROM properties
GROUP BY
	prop_zone,
	occupied;

*/
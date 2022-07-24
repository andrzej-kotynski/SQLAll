/* Joining Multiple Columns
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288724#content

-- both cities AND countries need to be matched
-- joining cities is a many-to-many relationship

-- Key - a column which has unique values or a set of columns which has unique
		 combination of values. In this instance it's c.city and c.country

SELECT c.population, c.city, c.country, s.country AS store_country, s.store_id, s.area_sqm
FROM cities c INNER JOIN stores s
ON c.city = s.city
AND c.country = s.country;

*/
/*The CASE Expression
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24304666#content

* The CASE expression has the functionality of an IF-THEN-ELSE statement
* Often people will refer to SQL statement that includes a CASE expression
  as a CASE statement


* Task:
Add an expression to the query called 'customer_status'.
If a customer is from the USA and is a club member give a value of
'Domestic non-member'.
If a customer is not from the USA, but is a club member then their customer 
status is 'Foreign member'. 
If not from the USA and is not a club member then 'Foreign non-member'.


* Search form of CASE expression

SELECT
	customer_id, first_name, country, club_member,
	CASE WHEN country = 'USA' AND club_member = 'YES' THEN 'Domestic member'
		 WHEN country = 'USA' AND club_member = 'NO' THEN 'Domestic non-member'
		 WHEN country <> 'USA' AND club_member = 'YES' THEN 'Foreign member'
		 WHEN country <> 'USA' AND club_member = 'NO' THEN 'Foreign non-member'
		 ELSE 'unknown'
		 END AS customer_status
FROM customers;

* When clauses are evaluated in the order in which they are written, 
  therefore the same as above can be written as:

SELECT
	customer_id, first_name, country, club_member,
	CASE WHEN country = 'USA' AND club_member = 'YES' THEN 'Domestic member'
		 WHEN country = 'USA' AND club_member = 'NO' THEN 'Domestic non-member'
		 WHEN club_member = 'YES' THEN 'Foreign member'
		 WHEN club_member = 'NO' THEN 'Foreign non-member'
		 ELSE 'unknown'
		 END AS customer_status
FROM customers;
-- third and fourth WHEN clause do not include results of country = 'USA', because
they were already covered in the first and second WHEN clause


* Simple form of CASE expression - does not include information about membership

SELECT
	customer_id, first_name, country, club_member,
CASE country
	WHEN 'USA' THEN 'Domestic'
	ELSE 'Foreign' 
	END AS customer_category
FROM customers;
*/
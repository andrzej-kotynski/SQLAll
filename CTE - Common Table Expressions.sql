/* Common Table Expressions (CTEs)
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24291914#content


* CTE Syntax

WITH <CTE_Name>
AS
(
	<inner query>
)
<outer query>;


* Example

-- Derived Table:
SELECT s.product_id, s.category, s.price
FROM
(
	SELECT
		product_id, 
		category, 
		price,
		RANK() OVER (PARTITION BY category ORDER BY price DESC) AS rnk
	FROM products
) s
WHERE s.rnk = 1;

-- Common Table Expression:
WITH s
AS
(
	SELECT
		product_id, 
		category, 
		price,
		RANK() OVER (PARTITION BY category ORDER BY price DESC) AS rnk
	FROM products
)
SELECT s.product_id, s.category, s.price
FROM s
WHERE s.rnk = 1;


* Task:
  Return account contacts for contacts who have not been contacted since 1st
  of January 2020 and have also not made any orders since 1st of January 2020.

WITH not_recently_contacted AS
(
	SELECT
		contact_name,
		last_contacted,
		account_id
	FROM dbo.account_contacts
	WHERE last_contacted < '20200101'
),
old_orders AS
(
	SELECT
		order_id,
		account_id,
		order_date
	FROM dbo.orders
	WHERE order_date < '20200101'
)
SELECT 
	nrc.contact_name,
	nrc.last_contacted,
	nrc.account_id
FROM not_recently_contacted nrc
WHERE EXISTS
(
	SELECT *
	FROM old_orders oo
	WHERE nrc.account_id = oo.account_id
);
*/
/* Predicate Placement: ON clause vs. WHERE clause
-- https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288748#content

Predicate - a condition that evaluates either true, false or NULL

For INNER JOIN the predicate placement doesn't matter, the query result will 
be the same regardless if the predicate is placed in ON or WHERE clause.

* Task:
Return suppliers from India and the products they supply.
(i.e. only return Indian suppliers that are supplying products)

SELECT s.supplier_name, s.country, s.supplier_id, p.product_id, p.prod_name
FROM suppliers s INNER JOIN products p
ON s.supplier_id = p.supplier_id
WHERE s.country = 'India'; -- it's technically correct for INNER JOIN

* Task:
Return suppliers from India and the products they supply, including suppliers
from India that are not supplying any products.

SELECT s.supplier_name, s.country, s.supplier_id, p.product_id, p.prod_name
FROM suppliers s INNER JOIN products p
ON s.supplier_id = p.supplier_id
AND s.country = 'India'; -- why this line is even necessary?

The query result also displays suppliers from Germany
*/
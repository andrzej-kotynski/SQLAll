/* Set Operators precedence

1 - parenthesis
2 - INTERSECT
3 - UNION, UNION ALL, EXCEPT


SELECT product_id
FROM products
UNION
SELECT product_id
FROM competitions
INTERSECT
SELECT product_id
FROM order_details;

* Forced precedence with parenthesis:

(
SELECT product_id
FROM prodcuts
UNION
SELECT product_id
FROM competitions
)
INTERSECT
SELECT product_id
FROM oreder_details;

*/
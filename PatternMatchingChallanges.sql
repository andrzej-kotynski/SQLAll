USE SAMPLEDB
GO

-- First Challange

SELECT *
FROM hcm.countries
WHERE country_name LIKE 'N%';

-- Second Challange

SELECT *
FROM oes.customers
WHERE email LIKE '%gmail.com';

-- Third Challange
SELECT *
FROM oes.products
WHERE product_name LIKE '%mouse%';

-- Fourth Challange
SELECT *
FROM oes.products
WHERE product_name LIKE '%[0-9]';
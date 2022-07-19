USE SAMPLEDB
GO

/*

Task:
Select minimum prop value.

SELECT
MIN(prop_value) AS minimum_prop_value
FROM properties;

Task:
Select max prop value.

SELECT
MAX(prop_value) AS maximum_prop_value
FROM properties;

Task: 
Create a sum of prop values.

SELECT
SUM(prop_value) AS total_value -- sums up all non-NULL prop values
FROM properties;

Task:
Create an average of prop values.

SELECT
AVG(prop_value) AS mean_prop_value -- averages up all non-NULL prop values
FROM properties;

Task:
Account the number of non-NULL values in the column 'suffix'.

SELECT
COUNT(suffix) AS count_suffix -- counts all non-NULL prop values
FROM properties;

Task:
Account the number of all row values 

SELECT
COUNT(*) AS total_count
FROM properties;

Task:
Account the number of all values and distinct values in row street_num

SELECT
COUNT(street_num) AS street_num_cnt,
COUNT(DISTINCT street_num) AS unique_street_num_cnt
FROM properties;

*/
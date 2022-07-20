USE SAMPLEDB
GO

/*

* AND OPERATOR
Task:
Write a query to return only hotel rooms that have 
both a room style equal to 'Single' AND a window view equal to 'Ocean'.

SELECT *
FROM HOTEL_ROOMS
WHERE ROOM_STYLE = 'Single' AND WINDOW_VIEW = 'Ocean';



* OR OPERATOR
Task:
Write a query to return only hotel rooms that have a room
style equal to 'Single' OR a window view equal to 'Ocean'.

SELECT *
FROM HOTEL_ROOMS
WHERE ROOM_STYLE = 'Single' OR WINDOW_VIEW = 'Ocean';


--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288088#content
* OPERATOR PRECEDENCE

SELECT *
FROM HOTEL ROOMS
WHERE ROOM_STYLE = 'Single' OR ROOM_STYLE = 'Double' AND WINDOW_VIEW = 'Ocean'; -- Same as:  WHERE ROOM_STYLE = 'Single' OR (ROOM_STYLE = 'Double' AND WINDOW_VIEW = 'Ocean'); 

AND operator has precedence over the OR operator

SELECT *
FROM HOTEL ROOMS
WHERE (ROOM_STYLE = 'Single' OR ROOM_STYLE = 'Double') AND WINDOW_VIEW = 'Ocean';


--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288106#content
* IN Operator
	--IN operator can be used to check if a value is included in some 
	specified list of values
	--IN operator allows you to specify multiple values in the WHERE clause

SYNTAX:
SELECT *
FROM table1
WHERE column1 IN (value1, value2, value3,...);

Task: 
Write a query to return all shipments from supplier's 101, 102 or 104.

SELECT supplier_id, part_name, quantity
FROM shipments
WHERE supplier_id = 101 OR supplier_id = 102 OR supplier_id = 104;

IS SAME AS:
SELECT supplier_id, part_name, quantity
FROM shipments
WHERE supplier_id IN (101, 102, 104);

Task:
Write a query to return all shipments for part name's 'Brake Drum' or 'Fuel Filter'

SELECT supplier_id, part_name , quantity
FROM shipments
WHERE part_name IN ('Brake Drum', 'Fuel Filter')


*/
/* Full Outer Joins
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288402#content

SELECT s.student_id, s.first_name, ts.student_id AS ts_student_id, ts.test_id, ts.score
FROM students s FULL OUTER JOIN test_scores ts
ON s.student_id = ts.student_id;

OUTER keyword is optional:

SELECT s.student_id, s.first_name, ts.student_id AS ts_student_id, ts.test_id, ts.score
FROM students s FULL JOIN test_scores ts
ON s.student_id = ts.student_id;



It's relatively uncommon to need to do full join in properly designed database.
In a properly designed database there would be a constraint on FK column in the 
test_scores table.

*/
/* Joining more than two tables
--https://www.udemy.com/course/the-complete-sql-course-2021-learn-by-doing/learn/lecture/24288740#content

SELECT d.doc_id, d.doc_last_name, p.patient_id, p.last_name
FROM doctors d
INNER JOIN doctor_patients dp
ON d.doc_id = dp.doc_id
INNER JOIN patients p
ON dp.patient_id = p.patient_id;


* New doctor arrived and he doesn't have any patients yet.
Using above INNER JOIN the new doctor will be removed from the query result.
*/
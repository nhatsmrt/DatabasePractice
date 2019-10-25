# Write your MySQL query statement below
SELECT
        e.student_id AS student_id,
        MIN(e.course_id) AS course_id,
        e.grade AS grade
FROM Enrollments e
WHERE (e.student_id, e.grade) IN
    (
        SELECT
                e1.student_id AS student_id,
                MAX(e1.grade) AS grade
        FROM Enrollments e1
        GROUP BY e1.student_id
    )
GROUP BY e.student_id, e.grade
ORDER BY student_id;

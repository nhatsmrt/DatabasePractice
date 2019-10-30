# Write your MySQL query statement below
SELECT p.project_id AS project_id, e.employee_id AS employee_id
FROM Project p, Employee e,
    (
        SELECT p1.project_id as project_id, MAX(e1.experience_years) AS max_year
        FROM Employee e1
        JOIN Project p1
        ON p1.employee_id = e1.employee_id
        GROUP BY p1.project_id
    ) AS MostExperienced
WHERE
        p.employee_id = e.employee_id AND
        p.project_id = MostExperienced.project_id AND
        e.experience_years = MostExperienced.max_year;

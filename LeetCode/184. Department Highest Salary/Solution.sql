# Write your MySQL query statement below
SELECT  d.Name as Department, e.Name as Employee, e.Salary
FROM (Employee e RIGHT JOIN
      (SELECT DepartmentId, MAX(Salary) as Salary FROM Employee GROUP BY DepartmentId) AS X
      ON e.Salary = X.Salary AND e.DepartmentId = X.DepartmentId)
INNER JOIN Department d ON X.DepartmentId = d.Id
ORDER BY Salary

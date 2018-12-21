# Write your MySQL query statement below
SELECT Department, Employee, Salary FROM
    (SELECT e1.Name AS Employee, e1.Salary, COUNT(DISTINCT(e2.Salary)) + 1 AS Rank, d.Name AS Department
     FROM Employee e1
     LEFT JOIN Employee e2 ON e1.DepartmentId = e2.DepartmentId AND e1.Salary < e2.Salary
     INNER JOIN Department d ON d.Id = e1.DepartmentId
     GROUP BY e1.Name) AS X
WHERE Rank <= 3
ORDER BY Department, Salary DESC

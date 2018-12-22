# Write your MySQL query statement below
SELECT
    t.Request_at AS Day,
    CONVERT(COALESCE(X.Cancellations, 0) / COUNT(t.Id), DECIMAL(10,2)) AS "Cancellation Rate"
FROM
    Trips t INNER JOIN
    Users u
    ON
        t.Client_Id = u.Users_Id AND
        u.Banned = "No" AND
        t.Request_at BETWEEN "2013-10-01" AND "2013-10-03"
    LEFT JOIN
    (SELECT
        t.Request_at, COUNT(Id) AS Cancellations
    FROM
        Trips t INNER JOIN
        Users u
    ON
        t.Client_Id = u.Users_Id AND
        u.Banned = "No" AND
        t.Status != "Completed"
    GROUP BY t.Request_at
    ) AS X
    ON t.Request_at = X.Request_at
GROUP BY t.Request_at

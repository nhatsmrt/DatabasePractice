# Write your MySQL query statement below
SELECT t.team_id, t.team_name, IFNULL(SUM(Points.points), 0) AS num_points
FROM (
        (
            SELECT host_team AS id,
                (
                    CASE
                        WHEN host_goals > guest_goals THEN 3
                        WHEN host_goals = guest_goals THEN 1
                        ELSE 0
                    END
                ) AS points
            FROM Matches
        )
        UNION ALL
        (
            SELECT guest_team AS id,
                (
                    CASE
                        WHEN guest_goals > host_goals THEN 3
                        WHEN guest_goals = host_goals THEN 1
                        ELSE 0
                    END
                ) AS points
            FROM Matches
        )
) AS Points
RIGHT OUTER JOIN Teams t
ON t.team_id = Points.id
GROUP BY t.team_id, t.team_name
ORDER BY num_points DESC, team_id ASC;

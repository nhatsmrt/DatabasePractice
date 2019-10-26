# Write your MySQL query statement below
SELECT e.business_id as business_id
FROM Events e
JOIN
                (
                    SELECT
                            e1.event_type AS event_type,
                            AVG(e1.occurences) AS occurences
                    FROM Events e1
                    GROUP BY e1.event_type
                ) AvgOcc
ON
        e.event_type = AvgOcc.event_type AND
        e.occurences > AvgOcc.occurences
GROUP BY e.business_id
HAVING COUNT(*) > 1;

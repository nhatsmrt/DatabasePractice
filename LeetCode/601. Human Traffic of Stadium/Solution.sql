# Write your MySQL query statement below
SELECT s.id, s.date, s.people FROM stadium s INNER JOIN
(SELECT s2.id AS Lower, MIN(s3.id) AS Upper
FROM
    stadium s1, stadium s2, stadium s3, stadium s4
WHERE
    ((s1.id + 1 = s2.id AND s1.people < 100) OR s2.id = 1) AND
    s3.id > s2.id AND
    ((s4.Id = s3.Id + 1 AND s4.people < 100) OR s3.id = (SELECT MAX(Id) FROM stadium)) AND
    s2.people >= 100 AND s3.people >= 100
GROUP BY s2.id) AS X
ON s.id <= X.Upper AND s.id >= X.Lower AND X.Lower + 1 < X.Upper

# Write your MySQL query statement below
SELECT
    s1.Score, COUNT(DISTINCT(s2.Score)) + 1 AS Rank
    FROM Scores s1 LEFT JOIN Scores s2 ON s1.Score < s2.Score
    GROUP BY s1.Id
ORDER BY Rank

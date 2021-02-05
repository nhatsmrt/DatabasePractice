# Write your MySQL query statement below
SELECT point1.id AS p1, point2.id AS p2, ABS(point1.x_value - point2.x_value) * ABS(point1.y_value - point2.y_value) AS area
FROM points point1, points point2
WHERE point1.id < point2.id AND ABS(point1.x_value - point2.x_value) * ABS(point1.y_value - point2.y_value) > 0
ORDER BY area DESC, p1 ASC, p2 ASC

# Write your MySQL query statement below
SELECT SUM(TIV_2016) AS TIV_2016
FROM insurance ins
WHERE
    CONCAT(ins.LAT, CONCAT("$", ins.LON)) IN
        (
            SELECT CONCAT(ins2.LAT, CONCAT("$", ins2.LON))
            FROM insurance ins2
            GROUP BY ins2.LAT, ins2.LON
            HAVING COUNT(*) = 1
        )
    AND ins.TIV_2015 IN
    (
        SELECT ins2.TIV_2015
        FROM insurance ins2
        GROUP BY ins2.TIV_2015
        HAVING COUNT(*) > 1
    )

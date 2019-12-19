# Write your MySQL query statement below
SELECT f.followee AS follower, COUNT(DISTINCT f.follower) AS num
FROM follow f
WHERE f.followee IN (SELECT follower FROM follow)
GROUP BY f.followee;

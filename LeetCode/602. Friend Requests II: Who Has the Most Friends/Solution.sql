# Write your MySQL query statement below
SELECT id AS id, SUM(num) AS num
FROM
((SELECT accepter_id AS id, COUNT(*) AS num
FROM request_accepted r1
GROUP BY accepter_id)
UNION ALL
(SELECT requester_id AS id, COUNT(*) AS num
FROM request_accepted r1
GROUP BY requester_id)) AS num_friends
GROUP BY id
ORDER BY SUM(num) DESC
LIMIT 1;

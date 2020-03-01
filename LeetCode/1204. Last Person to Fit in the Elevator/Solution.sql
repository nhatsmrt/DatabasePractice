# Write your MySQL query statement below
SELECT q.person_name FROM
Queue q, (SELECT q1.person_id, (SELECT SUM(q2.WEIGHT) AS weight FROM Queue q2 WHERE q2.turn <= q1.turn) AS cumsum_weight
FROM Queue q1
HAVING cumsum_weight <= 1000
ORDER BY turn DESC
LIMIT 1) last_person
WHERE q.person_id = last_person.person_id;

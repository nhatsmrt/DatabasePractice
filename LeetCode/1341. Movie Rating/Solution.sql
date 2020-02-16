# Write your MySQL query statement below
(SELECT u.name AS results
FROM Movie_Rating r, Users u, Movies m
WHERE r.user_id = u.user_id AND r.movie_id = m.movie_id
GROUP BY u.name, u.user_id
ORDER BY COUNT(DISTINCT m.movie_id) DESC, u.name ASC
LIMIT 1)
UNION
(SELECT m.title AS results
FROM Movie_Rating r, Movies m
WHERE
        r.created_at >= DATE('2020-02-01') AND
        r.created_at < DATE('2020-03-01') AND
        r.movie_id = m.movie_id
GROUP BY m.title, m.movie_id
ORDER BY AVG(r.rating) DESC, m.title ASC
LIMIT 1);

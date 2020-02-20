# Write your MySQL query statement below
SELECT Post.id AS post_id, COUNT(DISTINCT s.sub_id) AS number_of_comments
FROM Submissions s
RIGHT OUTER JOIN (SELECT sub_id AS id FROM Submissions WHERE parent_id IS NULL) AS Post
ON s.parent_id = Post.id
GROUP BY Post.id
ORDER BY post_id ASC;

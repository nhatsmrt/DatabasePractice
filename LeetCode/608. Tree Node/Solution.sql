# Write your MySQL query statement below
SELECT id, (
    CASE
        WHEN ISNULL(p_id) THEN 'Root'
        WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
        ELSE 'Leaf'
    END
) AS Type
FROM tree t
ORDER BY id;

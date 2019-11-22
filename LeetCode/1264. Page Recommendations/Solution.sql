# Write your MySQL query statement below
SELECT DISTINCT l2.page_id AS recommended_page
FROM Likes l2, Friendship F
WHERE
        (
            (F.user1_id = 1 AND F.user2_id = l2.user_id) OR
            (F.user2_id = 1 AND F.user1_id = l2.user_id)
        ) AND
        l2.page_id NOT IN (
            SELECT l.page_id
            FROM Likes l
            WHERE l.user_id = 1
        );

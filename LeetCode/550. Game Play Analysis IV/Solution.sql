# Write your MySQL query statement below
SELECT ROUND(COUNT(a.player_id) / NumPlayer.num_player, 2) AS fraction
FROM Activity a
JOIN
(
    SELECT a1.player_id, MIN(a1.event_date) AS min_date
    FROM Activity a1
    GROUP BY a1.player_id
) AS PlayerInfo
ON a.player_id = PlayerInfo.player_id AND a.event_date = PlayerInfo.min_date + 1
JOIN
(
    SELECT COUNT(DISTINCT a2.player_id) AS num_player
    FROM Activity a2
) AS NumPlayer;

# Write your MySQL query statement below
SELECT b.book_id AS book_id, b.name AS name
FROM Books b
LEFT JOIN
        (
            SELECT Orders.book_id AS book_id, SUM(Orders.quantity) AS quantity
            FROM Orders
            WHERE DATE(Orders.dispatch_date) >= DATE("2018-06-23")
            GROUP BY Orders.book_id
        ) LastYear
ON  b.book_id = LastYear.book_id
WHERE
        (LastYear.quantity IS NULL OR LastYear.quantity < 10) AND
        DATE(b.available_from) <= DATE("2019-05-23");

WITH cte AS (
    SELECT buyer_name, ROW_NUMBER() OVER(ORDER BY timestamp) AS row_num
    FROM purchases
)
SELECT buyer_name
FROM cte
WHERE (row_num / 4) = FLOOR(row_num / 4)
GROUP BY 1
ORDER BY 1;
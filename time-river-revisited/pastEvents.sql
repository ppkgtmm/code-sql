WITH cte AS (
    SELECT DATE(MAX(event_date) - INTERVAL 7 DAY) AS last_week, 
    MAX(event_date) AS current
    FROM Events
)
SELECT name, event_date
FROM Events
WHERE event_date >= (SELECT last_week FROM cte) AND
event_date < (SELECT current FROM cte) 
ORDER BY event_date DESC;
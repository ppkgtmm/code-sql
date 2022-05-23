SELECT e.event_id, 
CASE 
    WHEN s.hours = 24 
    THEN DATE_FORMAT(e.date + INTERVAL s.timeshift MINUTE, "%Y-%m-%d %H:%i")
    ELSE DATE_FORMAT(e.date + INTERVAL s.timeshift MINUTE, "%Y-%m-%d %I:%i %p")
END AS formatted_date
FROM events e INNER JOIN settings s ON e.user_id = s.user_id
ORDER BY 1;
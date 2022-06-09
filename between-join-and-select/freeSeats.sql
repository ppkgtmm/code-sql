SELECT f.flight_id, p.number_of_seats - (
    SELECT COUNT(*) 
    FROM purchases
    WHERE flight_id = f.flight_id
) AS free_seats
FROM flights f INNER JOIN planes p ON f.plane_id = p.plane_id
ORDER BY 1;
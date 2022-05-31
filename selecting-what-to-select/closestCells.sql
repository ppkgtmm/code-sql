SELECT p1.id AS id1, 
(
    SELECT p2.id 
    FROM positions p2
    WHERE p2.id != p1.id
    ORDER BY ST_Distance(POINT(p1.x, p1.y), POINT(p2.x, p2.y)) 
    LIMIT 1
) AS id2
FROM positions p1
ORDER BY 1;
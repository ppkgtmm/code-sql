SELECT ROUND(SUM(ST_Distance(Point(c1.x, c1.y), Point(c2.x, c2.y))), 9) AS total
FROM cities c1 INNER JOIN cities c2 ON c1.id + 1 = c2.id;
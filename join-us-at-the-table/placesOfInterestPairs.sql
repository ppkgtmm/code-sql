SELECT CASE
    WHEN s1.name < s2.name THEN s1.name
    ELSE s2.name
END AS place1,
CASE
    WHEN s1.name > s2.name THEN s1.name
    ELSE s2.name
END AS place2
FROM sights s1 INNER JOIN sights s2 ON s1.id < s2.id AND 
ST_Distance(Point(s1.x, s1.y), Point(s2.x, s2.y)) < 5
ORDER BY 1, 2;
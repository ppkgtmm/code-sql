SELECT ST_Area(ST_ConvexHull(ST_Collect(Point(x, y)))) AS area
FROM places;
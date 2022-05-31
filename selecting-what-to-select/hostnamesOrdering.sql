WITH cte AS (
    SELECT id, hostname, SUBSTRING_INDEX(hostname, '.', -1) AS part1,
    CASE WHEN LENGTH(hostname) - LENGTH(REPLACE(hostname, '.', '')) > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(hostname, '.', -2), '.', 1) END AS part2,
    CASE WHEN LENGTH(hostname) - LENGTH(REPLACE(hostname, '.', '')) > 1 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(hostname, '.', -3), '.', 1) END AS part3
    FROM hostnames
)
SELECT id, hostname 
FROM cte
ORDER BY part1, part2, part3;
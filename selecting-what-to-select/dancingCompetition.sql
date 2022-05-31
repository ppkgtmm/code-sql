WITH cte AS (
    SELECT MIN(first_criterion) AS minf, MAX(first_criterion) AS maxf, 
    MIN(second_criterion) AS mins, MAX(second_criterion) AS maxs,
    MIN(third_criterion) AS mint, MAX(third_criterion) AS maxt
    FROM scores
)
SELECT s.*
FROM scores s INNER JOIN cte c 
ON CAST(s.first_criterion = c.minf AS UNSIGNED) + CAST(s.first_criterion = c.maxf AS UNSIGNED) + 
CAST(s.second_criterion = c.mins AS UNSIGNED) + CAST(s.second_criterion = c.maxs AS UNSIGNED) + 
CAST(s.third_criterion = c.mint AS UNSIGNED) + CAST(s.third_criterion = c.maxt AS UNSIGNED) - 
CAST(c.minf = c.maxf AS UNSIGNED) - CAST(c.mins = c.maxs AS UNSIGNED) - CAST(c.mint = c.maxt AS UNSIGNED) < 2
ORDER BY s.arbiter_id;
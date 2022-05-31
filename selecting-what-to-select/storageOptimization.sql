WITH cte AS (
    SELECT id, 
    'name' AS column_name,
    CASE WHEN name IS NOT NULL THEN name END AS value
    FROM workers_info
    WHERE name IS NOT NULL
    UNION
    SELECT id, 
    'date_of_birth' AS column_name,
    CASE WHEN date_of_birth IS NOT NULL THEN date_of_birth END AS value
    FROM workers_info
    WHERE date_of_birth IS NOT NULL
    UNION
    SELECT id, 
    'salary' AS column_name,
    CASE WHEN salary IS NOT NULL THEN salary END AS value
    FROM workers_info
    WHERE salary IS NOT NULL
)
SELECT * 
FROM cte
WHERE value IS NOT NULL
ORDER BY 1, FIELD(column_name, 'name', 'date_of_birth','salary');
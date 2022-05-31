WITH last_null AS (
    SELECT anonymous_id, FIRST_VALUE(event_name) OVER(PARTITION BY anonymous_id ORDER BY received_at DESC) AS last_null
    FROM tracks
    WHERE user_id IS NULL
), first_nnull AS (
    SELECT anonymous_id, FIRST_VALUE(event_name) OVER(PARTITION BY anonymous_id ORDER BY received_at) AS first_nnull
    FROM tracks
    WHERE user_id IS NOT NULL	
), distinct_last_null AS (
    SELECT * 
    FROM last_null
    GROUP BY 1, 2
), distinct_first_nnull AS (
    SELECT * 
    FROM first_nnull
    GROUP BY 1, 2
)
SELECT dl.anonymous_id AS anonym_id, dl.last_null, df.first_nnull AS first_notnull 
FROM distinct_last_null dl LEFT JOIN distinct_first_nnull df
ON dl.anonymous_id = df.anonymous_id
ORDER BY 1;
WITH cte AS (
	SELECT country, COUNT(competitor) AS 'competitors'
	FROM foreignCompetitors
	GROUP BY country
	ORDER BY country
)
SELECT * FROM cte
UNION
SELECT 'Total:', COUNT(competitor) FROM foreignCompetitors;
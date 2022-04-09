(
	SELECT DISTINCT subscriber
	FROM full_year
    WHERE newspaper LIKE '%Daily%'
	UNION
    SELECT DISTINCT subscriber
	FROM half_year
	WHERE newspaper LIKE '%Daily%'
)
ORDER BY SUBSTRING_INDEX(subscriber, ' ', 1);
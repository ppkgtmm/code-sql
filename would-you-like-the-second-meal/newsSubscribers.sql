(
	SELECT subscriber
	FROM full_year
	WHERE newspaper LIKE '%Daily%'
	UNION
	SELECT subscriber
	FROM half_year
	WHERE newspaper LIKE '%Daily%'
)
ORDER BY SUBSTRING_INDEX(subscriber, ' ', 1);
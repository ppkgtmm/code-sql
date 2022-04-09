SELECT 
	CASE 
		WHEN DAYOFWEEK(mischief_date) >= 2 THEN DAYOFWEEK(mischief_date) - 2
		ELSE 6
	END
AS weekday, mischief_date, author, title
FROM mischief
ORDER BY weekday, FIELD(author, 'Huey', 'Dewey', 'Louie'), mischief_date, title;
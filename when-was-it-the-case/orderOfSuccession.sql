SELECT 
	CASE
		WHEN gender = 'F' THEN CONCAT('Queen ', name)
		ELSE CONCAT('King ', name)
	END AS name
FROM Successors
ORDER BY YEAR(CURRENT_DATE) - YEAR(birthday) DESC;
CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	WITH size AS (
		SELECT *,
		CASE
			WHEN upper_left_x = bottom_right_x THEN bottom_right_y - upper_left_y + 1
			WHEN upper_left_y = bottom_right_y THEN bottom_right_x - upper_left_x + 1
		END AS size
		FROM locations_of_ships
	), damages as (
		SELECT size, (
			SELECT SUM(
				CASE 
					WHEN upper_left_y = bottom_right_y AND bottom_right_y = target_y AND 
					(target_x BETWEEN upper_left_x AND bottom_right_x) THEN 1
					WHEN upper_left_x = bottom_right_x AND bottom_right_x = target_x AND 
					(target_y BETWEEN upper_left_y AND bottom_right_y) THEN 1
					ELSE 0
				END
			) FROM opponents_shots
		) AS damages
		FROM size
	)
	
	SELECT size, SUM(damages = 0) AS undamaged, SUM(damages != 0 AND damages != size) AS partly_damaged, SUM(damages = size) AS sunk
	FROM damages
	GROUP BY 1
	ORDER BY 1;
END
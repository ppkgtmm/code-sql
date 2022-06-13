CREATE FUNCTION is_winner(board VARCHAR(9), played_with VARCHAR(1)) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE target VARCHAR(3) DEFAULT CONCAT(played_with, played_with, played_with);
	RETURN (
		CASE 
			WHEN SUBSTRING(board, 1, 3) = target THEN 1
			WHEN SUBSTRING(board, 4, 3) = target THEN 1
			WHEN SUBSTRING(board, 7, 3) = target THEN 1
			WHEN CONCAT(SUBSTRING(board, 1, 1), SUBSTRING(board, 4, 1), SUBSTRING(board, 7, 1)) = target THEN 1
			WHEN CONCAT(SUBSTRING(board, 2, 1), SUBSTRING(board, 5, 1), SUBSTRING(board, 8, 1)) = target THEN 1
			WHEN CONCAT(SUBSTRING(board, 3, 1), SUBSTRING(board, 6, 1), SUBSTRING(board, 9, 1)) = target THEN 1
			WHEN CONCAT(SUBSTRING(board, 1, 1), SUBSTRING(board, 5, 1), SUBSTRING(board, 9, 1)) = target THEN 1	
			WHEN CONCAT(SUBSTRING(board, 3, 1), SUBSTRING(board, 5, 1), SUBSTRING(board, 7, 1)) = target THEN 1	
			ELSE 0
		END
	);
END;

CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	with outcome AS (
		SELECT name_naughts, name_crosses, is_winner(board, 'O') AS naughts_winner, is_winner(board, 'X') AS crosses_winner
	FROM results
	), players AS (
		SELECT name_naughts AS player
		FROM outcome
		UNION
		SELECT name_crosses AS player
		FROM outcome
	), summary AS (
		SELECT p.player, (
			SELECT SUM(
				CASE 
					WHEN name_naughts = p.player THEN 1
					WHEN name_crosses = p.player THEN 1
					ELSE 0
				END
			)
			FROM outcome
		) AS played, (
			SELECT SUM(
				CASE 
					WHEN name_naughts = p.player AND naughts_winner THEN 1
					WHEN name_crosses = p.player AND crosses_winner THEN 1
					ELSE 0
				END
			)
			FROM outcome
		) AS won, (
			SELECT SUM(
				CASE 
					WHEN (name_naughts = p.player OR name_crosses = p.player)  
					AND NOT naughts_winner AND NOT crosses_winner THEN 1
					ELSE 0
				END
			)
			FROM outcome
		) AS draw, (
			SELECT SUM(
				CASE 
					WHEN name_naughts = p.player AND NOT naughts_winner AND  crosses_winner THEN  1
					WHEN name_crosses = p.player AND NOT crosses_winner AND naughts_winner THEN 1
					ELSE 0
				END
			)
			FROM outcome
		) AS lost
		FROM players p
	)
	SELECT player AS name, (won * 2) + (draw * 1) AS points, played, won, draw, lost
	FROM summary
	ORDER BY 2 DESC, 3, 4 DESC, 1;
END
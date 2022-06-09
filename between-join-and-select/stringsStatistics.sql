CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	DECLARE int_val INT DEFAULT 97; -- ascii code of lowercase a
	DECLARE stop_val INT DEFAULT 122; -- ascii code of lowercase z

	DROP TEMPORARY TABLE IF EXISTS letters;
	CREATE TEMPORARY TABLE letters (
		letter CHAR(1) PRIMARY KEY
	);

	WHILE int_val <= stop_val DO
		INSERT INTO letters VALUE(CHAR(int_val));
		SET int_val = int_val + 1;
	END WHILE;
	
	WITH total AS (
		SELECT *, (
			SELECT SUM(LENGTH(str) - LENGTH(REPLACE(str, letter, '')))
			FROM strs
		) AS total
		FROM letters
	), occurrence AS (
		SELECT *, (
			SELECT SUM(IF(str LIKE CONCAT('%', letter , '%'), 1, 0))
			FROM strs
		) AS occurrence
		FROM total
		WHERE total > 0
	), max_occurrence AS (
		SELECT *, (
			SELECT MAX(LENGTH(str) - LENGTH(REPLACE(str, letter, '')))
			FROM strs
		) AS max_occurrence
		FROM occurrence
	), max_occurrence_reached AS (
		SELECT *, (
			SELECT SUM(IF(max_occurrence = LENGTH(str) - LENGTH(REPLACE(str, letter, '')), 1, 0))
			FROM strs
		) AS max_occurrence_reached
		FROM max_occurrence
	)
    
	SELECT *
	FROM max_occurrence_reached;
END
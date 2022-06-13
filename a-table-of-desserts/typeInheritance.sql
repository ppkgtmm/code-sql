CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	DECLARE is_first INT DEFAULT TRUE;
		
	DROP TEMPORARY TABLE IF EXISTS acc;
	CREATE TEMPORARY TABLE acc
	SELECT derived FROM inheritance WHERE base = 'Number';
	
	DROP TEMPORARY TABLE IF EXISTS cur;
	CREATE TEMPORARY TABLE cur
	SELECT * FROM acc;
	
	WHILE is_first OR ROW_COUNT() DO

		DROP TEMPORARY TABLE IF EXISTS nex;
		CREATE TEMPORARY TABLE nex
		SELECT i.derived
		FROM inheritance i INNER JOIN cur c ON i.base = c.derived;
		
		DROP TEMPORARY TABLE IF EXISTS cur;
		CREATE TEMPORARY TABLE cur
		SELECT * FROM nex;
		
		INSERT INTO acc
		SELECT * FROM nex;
		
		SET is_first = FALSE;
	END WHILE;
	
	SELECT var_name, type AS var_type
	FROM variables
	WHERE type IN (SELECT derived FROM acc)
	ORDER BY 1;
END
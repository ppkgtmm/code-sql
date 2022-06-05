CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	DECLARE finished INT DEFAULT FALSE;
	DECLARE q VARCHAR(200);
	DECLARE q_name VARCHAR(100);
	DECLARE cur_q CURSOR FOR (SELECT query_name, code FROM queries);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = TRUE;
	
	DROP TEMPORARY TABLE IF EXISTS outputs;
	CREATE TEMPORARY TABLE outputs(
		query_name VARCHAR(100) PRIMARY KEY,
		val_int INT,
		val_float DECIMAL(9, 3),
		val_date DATE
	);
	
	OPEN cur_q;
	populate: LOOP
		FETCH cur_q INTO q_name, q;
		IF finished THEN
			LEAVE populate;
		END IF;
		SET @temp = NULL;
		SET @query = CONCAT('SELECT (', q, ') INTO @temp');
		PREPARE stmt FROM @query;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		IF q LIKE '%date%' THEN
			INSERT INTO outputs VALUES (q_name, NULL, NULL, @temp);
		ELSEIF q LIKE '%avg%' THEN
			INSERT INTO outputs VALUES (q_name, NULL, @temp, NULL);
		ELSE
			INSERT INTO outputs VALUES (q_name, @temp, NULL, NULL);
		END IF;
	END LOOP;
	CLOSE cur_q;
	
	SELECT query_name, COALESCE(val_int, val_date, FORMAT(val_float, 9, 9)) AS val
	FROM outputs;
END
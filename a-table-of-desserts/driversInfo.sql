CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	DECLARE total_miles INT DEFAULT 0;	
	DECLARE driver VARCHAR(20);
	DECLARE cnt INT;
	DECLARE miles INT;
	
	DECLARE done INT DEFAULT FALSE;	
	DECLARE d_cur CURSOR FOR (
		SELECT driver_name, COUNT(*) AS n_ins, SUM(miles_logged) AS d_miles
		FROM inspections 
		GROUP BY 1
		ORDER BY 1
	);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	DROP TEMPORARY TABLE IF EXISTS summary;
	CREATE TEMPORARY TABLE summary(
		id INT PRIMARY KEY AUTO_INCREMENT,
		summary VARCHAR(150) 
	);
	
	SELECT SUM(miles_logged) INTO total_miles
	FROM inspections;
	
	INSERT INTO summary (summary) VALUES (
		CONCAT(' Total miles driven by all drivers combined: ', total_miles)
	);
	
	OPEN d_cur;
	populate: LOOP
		FETCH d_cur INTO driver, cnt, miles;
		IF done THEN
			LEAVE populate;
		END IF;
		INSERT INTO summary (summary) VALUES (
			CONCAT(' Name: ', driver, '; number of inspections: ', cnt ,'; miles driven: ', miles)
		);
		INSERT INTO summary (summary)
		SELECT CONCAT('  date: ', date, '; miles covered: ', miles_logged)
		FROM inspections
		WHERE driver_name = driver
		ORDER BY date;
	END LOOP;
	CLOSE d_cur;
	
	SELECT summary
	FROM summary;
END
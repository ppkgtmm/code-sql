CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	DECLARE kb INT DEFAULT POWER(2, 10);
	DECLARE mb INT DEFAULT POWER(2, 20);
	
	SELECT id, email_title, 
	CASE 
		WHEN size >= mb THEN CONCAT(FLOOR(size / mb), ' Mb')
		ELSE CONCAT(FLOOR(size/ kb), ' Kb')
	END AS short_size
	FROM emails
	ORDER BY size DESC;
END
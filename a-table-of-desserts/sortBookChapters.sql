CREATE FUNCTION get_number(roman CHAR(1)) RETURNS INT DETERMINISTIC
BEGIN
	RETURN (
		CASE
			WHEN roman = 'I' THEN 1
			WHEN roman = 'V' THEN 5
			WHEN roman = 'X' THEN 10
			WHEN roman = 'L' THEN 50
			WHEN roman = 'C' THEN 100
			WHEN roman = 'D' THEN 500
			ELSE 1000
		END
	);
END;

CREATE FUNCTION get_part(p1 CHAR(1), p2 CHAR(1)) RETURNS INT DETERMINISTIC
BEGIN
	IF p1 = '' THEN
		RETURN 0;
	END IF;
	RETURN (
		CASE
			WHEN p1 = 'I' AND p2 NOT IN ('', 'I') THEN -1
			WHEN p1 = 'X' AND p2 NOT IN ('', 'I', 'V', 'X') THEN -10
			WHEN p1 = 'C' AND p2 NOT IN ('', 'I', 'V', 'X', 'L', 'C') THEN -100
			ELSE get_number(p1)
		END
	);
END;
	
CREATE PROCEDURE solution()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
	WITH cte AS (
		SELECT chapter_name, chapter_number, 
		SUBSTRING(chapter_number, 1, 1) AS p1,
		SUBSTRING(chapter_number, 2, 1) AS p2,
		SUBSTRING(chapter_number, 3, 1) AS p3,
		SUBSTRING(chapter_number, 4, 1) AS p4,
		SUBSTRING(chapter_number, 5, 1) AS p5,
		SUBSTRING(chapter_number, 6, 1) AS p6,
		SUBSTRING(chapter_number, 7, 1) AS p7,
		SUBSTRING(chapter_number, 8, 1) AS p8,
		SUBSTRING(chapter_number, 9, 1) AS p9,
		SUBSTRING(chapter_number, 10, 1) AS p10,
		SUBSTRING(chapter_number, 11, 1) AS p11,
		SUBSTRING(chapter_number, 12, 1) AS p12
		FROM book_chapters
	)
	
	SELECT chapter_name
	FROM cte
	ORDER BY get_part(p1, p2) + get_part(p2, p3) + get_part(p3, p4) + get_part(p4, p5)+ get_part(p5, p6) + get_part(p6, p7) + get_part(p7, p8) + get_part(p8, p9) + get_part(p9, p10) + get_part(p10, p11) + get_part(p11, p12);
END
WITH one_away AS (
	SELECT SUM(first_team_score)
	FROM scores
	WHERE match_host = 2
), two_away AS (
	SELECT SUM(second_team_score)
	FROM scores
	WHERE match_host = 1
), sum_one AS (
	SELECT SUM(first_team_score)
	FROM scores
)
SELECT CASE
	WHEN SUM(first_team_score) > SUM(second_team_score) THEN 1
	WHEN SUM(first_team_score) < SUM(second_team_score) THEN 2
	WHEN SUM(first_team_score - second_team_score) > 0 THEN 1
	WHEN SUM(first_team_score - second_team_score) < 0 THEN 2
	WHEN (SELECT * FROM one_away) > (SELECT * FROM two_away) THEN 1
	WHEN (SELECT * FROM one_away) < (SELECT * FROM two_away) THEN 2
	ELSE 0
END AS winner
FROM scores;

SELECT GROUP_CONCAT(DISTINCT country ORDER BY country SEPARATOR ';') AS countires
FROM diary;
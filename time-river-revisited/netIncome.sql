SET sql_mode = 'NO_UNSIGNED_SUBTRACTION';
SELECT YEAR(date) AS year, QUARTER(date) AS quarter, SUM(profit - loss) AS net_profit
FROM accounting
GROUP BY 1, 2
ORDER BY 1, 2; 
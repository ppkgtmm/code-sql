WITH cte AS (
    SELECT salary, 
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk_desc,
    DENSE_RANK() OVER(ORDER BY salary) AS rnk_asc
    FROM employees
), diff AS (
    SELECT (SELECT SUM(salary) FROM cte WHERE rnk_desc = 1) - 
        (SELECT SUM(salary) FROM cte WHERE rnk_asc = 1) AS salary_diff
)
SELECT COALESCE(salary_diff, 0) AS salary_diff
FROM diff;
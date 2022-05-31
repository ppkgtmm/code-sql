SELECT ae.id, 
CASE
    WHEN SUM(ep.expenditure_sum) - ae.value <= 0 THEN 0
    ELSE SUM(ep.expenditure_sum) - ae.value
END AS loss
FROM expenditure_plan ep INNER JOIN allowable_expenditure ae 
ON CAST(DATE_FORMAT(ep.monday_date, '%v') AS UNSIGNED) BETWEEN ae.left_bound AND ae.right_bound
GROUP BY 1
ORDER BY 1;
SELECT name
FROM (
    (SELECT name, 1 AS dep FROM pr_department ORDER BY date_joined DESC LIMIT 5)
    UNION ALL
    (SELECT name, 2 AS dep FROM it_department ORDER BY date_joined DESC LIMIT 5)
    UNION ALL
    (SELECT name, 3 AS dep FROM sales_department ORDER BY date_joined DESC LIMIT 5)	
) sub
ORDER BY dep, name;
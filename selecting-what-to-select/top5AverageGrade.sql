SELECT ROUND(AVG(sub.grade), 2) AS average_grade
FROM (
    SELECT grade
    FROM students
    ORDER BY 1 DESC
    LIMIT 5
) sub;
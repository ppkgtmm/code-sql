WITH dep_summary AS (
    SELECT d.id, name, (
        SELECT COUNT(*) FROM Employee e WHERE e.department = d.id
    ) AS emp_number, COALESCE(
        (SELECT SUM(salary) FROM Employee e WHERE e.department = d.id),
        0
    ) AS total_salary
    FROM Department d
), dep_row_number AS (
    SELECT name, emp_number, total_salary, ROW_NUMBER() OVER(ORDER BY total_salary DESC, emp_number DESC, id) AS row_num
    FROM dep_summary
    WHERE emp_number < 6
    ORDER BY 3 DESC, 2 DESC, id
)

SELECT name, emp_number, total_salary
FROM dep_row_number
WHERE MOD(row_num, 2) != 0;
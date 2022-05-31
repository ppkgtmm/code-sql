SELECT d.dep_name
FROM departments d LEFT JOIN employees e ON d.id = e.department
WHERE e.id IS NULL
ORDER BY d.id;
SELECT COUNT(*) as number_of_nulls
FROM departments
WHERE description IS NULL OR LOWER(TRIM(description)) IN ('-', 'nil', 'null');
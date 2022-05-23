SELECT c.candidate_id AS student_id
FROM candidates c LEFT JOIN detentions d ON c.candidate_id = d.student_id
WHERE c.candidate_id IS NOT NULL AND d.student_id IS NULL
ORDER BY 1;
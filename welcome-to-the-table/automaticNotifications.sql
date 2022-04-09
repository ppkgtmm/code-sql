SELECT email
FROM users
WHERE LOWER(role) NOT IN ("admin", "premium")
ORDER BY email;
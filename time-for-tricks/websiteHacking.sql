SELECT id, login, name
FROM users
WHERE type = 'user' OR TRUE
ORDER BY id;
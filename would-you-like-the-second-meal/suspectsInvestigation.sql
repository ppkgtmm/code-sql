SELECT id, name, surname
FROM Suspect
WHERE height <= 170 AND LOWER(name) LIKE 'b%' AND LOWER(surname) LIKE 'gre_n'
ORDER BY id;
SELECT id, name, surname
FROM Suspect
WHERE height <= 170 OR LOWER(name) NOT LIKE 'B%' OR LOWER(surname) NOT LIKE 'gre_n'
ORDER BY id;
SELECT name 
FROM people_hobbies
WHERE hobbies & 1 AND hobbies & 2
ORDER BY name;
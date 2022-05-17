SELECT *
FROM phone_numbers
WHERE phone_number REGEXP '^1-[0-9]{3}-[0-9]{3}-[0-9]{4}$' OR 
phone_number REGEXP '^\\(1\\)[0-9]{3}-[0-9]{3}-[0-9]{4}$'
ORDER BY surname;
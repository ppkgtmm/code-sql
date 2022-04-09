SELECT first_name, second_name, attribute
FROM users
WHERE CAST(attribute AS BINARY) REGEXP BINARY CONCAT('^.+%', first_name, '_', second_name,'%.*$')
ORDER BY attribute;
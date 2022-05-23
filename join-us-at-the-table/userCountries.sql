SELECT u.id, COALESCE(c.country, 'unknown') AS country
FROM users u LEFT JOIN cities c ON u.city = c.city;
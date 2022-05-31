SELECT holiday_date AS ski_date
FROM holidays h INNER JOIN weather w ON h.holiday_date = w.sunny_date;
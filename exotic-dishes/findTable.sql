SELECT TABLE_NAME AS tab_name, COLUMN_NAME AS col_name, DATA_TYPE AS data_type
FROM information_schema.columns
WHERE TABLE_SCHEMA = 'ri_db' AND TABLE_NAME LIKE 'e%s'
ORDER BY 1, 2;
# code-sql

- Order rows by a custom order for a field

```sql
...
ORDER BY FIELD(col_name, val_1, val_2, ...)
```

- Cast column to another type

```sql
SELECT CAST(col_name AS TYPE)
...
```

- Pattern matching case sensitive

```sql
...
WHERE CAST(string AS BINARY) REGEXP BINARY pattern
```

- IF statement

```sql
SELECT IF(condition, value_for_true, value_for_false)
...
```

- Get substring before n th occurrence of delimiter

```sql
...
WHERE SUBSTRING_INDEX(string, delimiter, n) = target_substring
```

- Concatenate column rows ordered by order_column(s) using separator

```sql
SELECT GROUP_CONCAT(column ORDER BY order_column(s) SEPARATOR separator)
...
```

- Remove leading and trailing whitespaces from text

```sql
SELECT TRIM(text) AS trimmed_text
...
```

- Aggregate column values by multiplication

```sql
SELECT ROUND(EXP(SUM(LOG(column)))) AS product
...
```

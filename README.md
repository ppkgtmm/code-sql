# code-sql

- Order rows by a custom order for a field

```sql
    ...
    ORDER BY FIELD(col_name, val_1, val_2, ...)
```

- Cast column to another type

```sql
    CAST(col_name AS TYPE)
```

- Pattern matching case sensitive

```sql
    ...
    WHERE CAST(string AS BINARY) REGEXP BINARY pattern
```

- IF statement

```sql
    IF(condition, value_for_true, value_for_false)
```

- Get substring before n th occurrence of delimiter

```sql
    SUBSTRING_INDEX(string, delimiter, n)
```

- Concatenate column rows ordered by order_column(s) using separator

```sql
    GROUP_CONCAT(column ORDER BY order_column(s) SEPARATOR separator)
```

- Remove leading and trailing whitespaces from text

```sql
SELECT TRIM(text) AS trimmed_text
```

- Aggregate column values by multiplication

```sql
SELECT ROUND(EXP(SUM(LOG(column)))) AS product
```

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

- Select rows which set column contains i th item defined in set data type

```sql
...
WHERE set_column & bit_value
```

bit_value (base 10) represents binary number with bit 1 at only the i th position

- Select set column values as comma-separated string

```sql
SELECT set_column
...
```

- Select set column as base 10

```sql
SELECT set_column + 0
...
```

in case a row contain more than one item in set column, set element's base 10 values will be summed

- Extract value at tag's i th child from XML document

```sql
SELECT ExtractValue(xml_doc, '/tag/child[i]')
...
```

- Create point object from x and y coordinates

```sql
SELECT Point(x, y) AS geom_value
...
```

- Aggregate geometry values to get single geometry collection

```sql
SELECT ST_Collect(geom_value) AS geom_collection
...
```

- Find convex hull of geometry collection

```sql
SELECT ST_ConvexHull(geom_collection) AS convex_hull
...
```

convex hull is a shape that encloses a geom_collection with maximum area and minimum circumference

- Calculate area of a shape

```sql
SELECT ST_Area(convex_hull) AS area
...
```

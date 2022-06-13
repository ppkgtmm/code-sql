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

- Find text with pattern word surrounded by parentheses

```sql
...
WHERE text_column REGEXP '\\(pattern\\)'
```

- Initialize user-defined variable (single value)

```sql
SET @variable1 = constant;
SET @variable2 = DATETIME(constant);
SET @variable3 = (SELECT ... LIMIT 1);
```

if a variable has multiple values, use a temporary table (which stays until session is terminated) instead

- Iterate using while loop

```sql
WHILE condition DO
    statements;
    ...
END WHILE;
```

- Find euclidean distance between 2 coordinates

```sql
SELECT ST_Distance(Point(x1, y1), Point(x2, y2))
...
```

- Convert date column values to specified format

```sql
SELECT DATE_FORMAT(date_column, format_string)
...
```

- Add foreign key to table using predefined column(s)

```sql
...
FOREIGN KEY (fk_column1, fk_column2, ...)
REFERENCES parent_table (pk_column1, pk_column2, ...)
-- below are optional
ON UPDATE reference_option
ON DELETE reference_option
```

example of foreign key reference options are

    - RESTRICT : cannot delete parent table row when it was referenced
    - CASCADE : delete parent table row along with referencing rows
    - SET NULL : set the fk of referencing rows to null
    - NO ACTION : delete parent table row but keep referencing rows
    - SET DEFAULT : set the fk of referencing rows to the fk column's default value

- Update multiple columns' values for rows satisfying specified condition

```sql
UPDATE table_name
SET column1 = ..., column2 = ...
WHERE condition
```

- Create new or replace existing view (a view is a query stored)

```sql
CREATE OR REPLACE VIEW view_name
AS query
```

- Add columns to existing table

```sql
ALTER TABLE table_name
ADD COLUMN column_name1 column_type constraints,
ADD COLUMN column_name2 ....
```

- Define columns when creating table

```sql
CREATE TABLE table_name (
    column_name1 column_type constraints,
    column_name2 ....
)
```

example of column constraints

    - NOT NULL | NULL : column cannot | can contain null values
    - CHECK (condition) : validation for row
    - UNIQUE : column or combination of column value must ne unique
    - PRIMARY KEY : unique and not null column or combination of columns
    - DEFAULT <default-value> : specify default value for column

constraints involving multiple columns can be defined after all columns' definition

- Naming a constraint

```sql
...
CONSTRAINT constraint_name constraint_definition
```

- Check if subquery has returned any rows

```sql
...
WHERE EXISTS subquery
```

- Get first non-null value from a list

```sql
SELECT COALESCE(value_1, value_2, value_3)
...
```

- Define a function having input parameters and return value

```sql
CREATE FUNCTION function_name(param1 parame1_type, param2 parame2_type, ...) RETURNS return_value_type characteristic
BEGIN
    ...
    RETURN return_value;
END;
```

function characteristic can be

    - DETERMINISTIC : function returns same output value if the same input parameters were specified
    - NOT DETERMINISTIC : function may return different output value though the same input parameters were specified

- Access metadata of tables or columns in specified database

```sql
...
FROM information_schema.tables
WHERE TABLE_SCHEMA = target_db_name
```

or

```sql
...
FROM information_schema.columns
WHERE TABLE_SCHEMA = target_db_name
```

- Declare local variable(s) - can only be done at the start of a scope (a scope is bounded by a `BEGIN` and `END` pair)

```sql
BEGIN
	DECLARE variable_name1 variable_type1 DEFAULT default_value1;
	DECLARE variable_name2 variable_type2; /* default value is null */
    ...
END
```

- Traverse over records in database using cursor

```sql
DECLARE done_flag INT DEFAULT FALSE;
DECLARE cursor_name CURSOR FOR select_statement;

/* set done flag to true when traversal is complete */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_flag = TRUE;

/* store column values returned by select_statement */
DECLARE variable_name1 variable_type1;
DECLARE variable_name2 variable_type2;

OPEN cursor_name;

loop_name: LOOP
    FETCH cursor_name INTO variable_name1, variable_name2;
    IF done_flag THEN
        LEAVE loop_name;
    END IF;
    ...
END LOOP;
CLOSE cursor_name;
```

- Get remainder after division

```sql
SELECT MOD(numerator, denominator)
...
```

- Get character from its integer ascii code

```sql
SELECT CHAR(ascii_code)
...
```

- Insert into table using data selected from other table

```sql
INSERT INTO destination_table_name
SELECT column1, column2
FROM source_table_name
...
```

- Get number of rows affected by previous insert, update or delete statement

```sql
SELECT ROW_COUNT()
```

DROP FUNCTION IF EXISTS get_total;
CREATE FUNCTION get_total(items VARCHAR(45)) RETURNS INT DETERMINISTIC
BEGIN
    SET @delim = ';';
    SET @items_count = LENGTH(items) - LENGTH(REPLACE(items, @delim, '')) + 1;
    SET @i = 1;
    SET @total = 0;
    WHILE @i <= @items_count DO
        SET @id = SUBSTRING_INDEX(SUBSTRING_INDEX(items, @delim, @i), @delim, -1);
        SET @total = @total + (
            SELECT price
            FROM item_prices
            WHERE id = CAST(@id AS UNSIGNED)
        );
        SET @i = @i + 1;
    END WHILE;
    RETURN @total;
END;

SELECT id, buyer, get_total(items) AS total_price
FROM orders
ORDER BY id;
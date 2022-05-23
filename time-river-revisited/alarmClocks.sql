DROP TEMPORARY TABLE IF EXISTS alarm;
CREATE TEMPORARY TABLE alarm(
    alarm_date DATETIME NOT NULL,
    PRIMARY KEY(alarm_date)
);

SET @dt = (SELECT input_date FROM userInput);
SET @yr = YEAR(@dt);

WHILE YEAR(@dt) = @yr DO
    INSERT INTO alarm VALUES (@dt);
    SET @dt = @dt + INTERVAL 1 WEEK;
END WHILE;

SELECT * FROM alarm;
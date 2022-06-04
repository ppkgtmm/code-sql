WITH order_analytics AS (
    SELECT id, YEAR(order_date) AS year, QUARTER(order_date) AS quarter, 
    type, price * quantity AS total_price
    FROM orders
)

SELECT *
FROM order_analytics
ORDER by id;
WITH daily_sales AS (
    SELECT
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),

daily_calculation AS (
    SELECT
        visited_on,
        daily_amount,
        SUM(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROW_NUMBER() OVER (
            ORDER BY visited_on
        ) AS row_num
    FROM daily_sales
)

SELECT
    visited_on,
    amount,
    ROUND(amount / 7.0, 2) AS average_amount
FROM daily_calculation
WHERE row_num >= 7
ORDER BY visited_on;
SELECT COUNT(*) AS total_rows
FROM orders;

SELECT
MIN(`Order Date`) AS first_order,
MAX(`Order Date`) AS last_order
FROM orders;

SELECT
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit
FROM orders;

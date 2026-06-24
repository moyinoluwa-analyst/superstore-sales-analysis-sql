-- Total Rows

SELECT COUNT(*) AS total_rows
FROM orders;

-- Date Range

SELECT
MIN(`Order Date`) AS first_order,
MAX(`Order Date`) AS last_order
FROM orders;

-- Revenue Overview

SELECT
ROUND(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit,
SUM(Quantity) AS total_quantity
FROM orders;

-- Total Customers

SELECT
COUNT(DISTINCT `Customer ID`) AS total_customers
FROM orders;

-- Total Products

SELECT
COUNT(DISTINCT `Product ID`) AS total_products
FROM orders;

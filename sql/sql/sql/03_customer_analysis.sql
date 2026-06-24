-- Top Customers by Sales

SELECT
`Customer ID`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Customers Above Average Spend

SELECT
`Customer ID`,
ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
HAVING SUM(Sales) >
(
SELECT AVG(CustomerSales)
FROM
(
SELECT
SUM(Sales) AS CustomerSales
FROM orders
GROUP BY `Customer ID`
) x
);

-- Customers Spending More Than $5000

WITH customer_sales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
)

SELECT
COUNT(*) AS Customers_Above_5000
FROM customer_sales
WHERE Total_Sales > 5000;

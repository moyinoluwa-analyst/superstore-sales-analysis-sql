-- Customer Ranking

WITH customer_sales AS
(
SELECT
`Customer ID`,
SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
)

SELECT
`Customer ID`,
ROUND(Total_Sales,2) AS Total_Sales,
RANK() OVER(
ORDER BY Total_Sales DESC
) AS Sales_Rank
FROM customer_sales;

-- Product Ranking

WITH product_sales AS
(
SELECT
`Product Name`,
SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Product Name`
)

SELECT
`Product Name`,
ROUND(Total_Sales,2) AS Total_Sales,
DENSE_RANK() OVER(
ORDER BY Total_Sales DESC
) AS Product_Rank
FROM product_sales;

-- Monthly Sales Trend

WITH monthly_sales AS
(
SELECT
YEAR(`Order Date`) AS Order_Year,
MONTH(`Order Date`) AS Order_Month,
SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY
YEAR(`Order Date`),
MONTH(`Order Date`)
)

SELECT
Order_Year,
Order_Month,
ROUND(Monthly_Sales,2) AS Monthly_Sales
FROM monthly_sales
ORDER BY Order_Year, Order_Month;

-- Month-over-Month Analysis using LAG

WITH monthly_sales AS
(
SELECT
YEAR(`Order Date`) AS Order_Year,
MONTH(`Order Date`) AS Order_Month,
SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY
YEAR(`Order Date`),
MONTH(`Order Date`)
)

SELECT
Order_Year,
Order_Month,
ROUND(Monthly_Sales,2) AS Monthly_Sales,

ROUND(
LAG(Monthly_Sales)
OVER(
ORDER BY Order_Year, Order_Month
),2
) AS Previous_Month_Sales

FROM monthly_sales;

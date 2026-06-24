-- Sales by Category

SELECT
Category,
ROUND(SUM(Sales),2) AS total_sales
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;

-- Profit by Category

SELECT
Category,
ROUND(SUM(Profit),2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;

-- Profit by Sub-Category

SELECT
`Sub-Category`,
ROUND(SUM(Profit),2) AS total_profit
FROM orders
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;

-- State Performance

SELECT
State,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit DESC;

-- Regional Performance

SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Discount Analysis

SELECT
ROUND(Discount,2) AS Discount_Rate,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- Profit Margin by Category

SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percent
FROM orders
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

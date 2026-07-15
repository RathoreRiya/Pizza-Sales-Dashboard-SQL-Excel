SELECT * FROM dbo.pizza_sales



--DAILY TREND 
SELECT DATENAME(DW, order_date) AS order_by, COUNT(DISTINCT order_id) AS Total_orders FROM dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)

--HOURLY TREND
SELECT DATEPART(HOUR, order_time) AS oder_hours , COUNT(DISTINCT order_id) AS Total_orders FROM dbo.pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_category, SUM(Total_price) AS Total_Sales, SUM(TOtal_price) * 100 / 
(SELECT SUM(total_price) FROM dbo.pizza_sales WHERE MONTH(order_date) = 1) AS PTC
FROM dbo.pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales WHERE DATEPART (quarter, order_date) = 1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART (quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
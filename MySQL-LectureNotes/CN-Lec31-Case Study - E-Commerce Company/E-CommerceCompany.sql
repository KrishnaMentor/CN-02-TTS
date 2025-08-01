CREATE DATABASE Ecom;
USE Ecom;
DESC customers_india_adjusted;
DESC order_details_india_adjusted;
DESC orders_india_adjusted;
DESC products_india_adjusted;

ALTER TABLE customers_india_adjusted
RENAME TO customers;

ALTER TABLE order_details_india_adjusted
RENAME TO order_details;

ALTER TABLE orders_india_adjusted
RENAME TO orders;

ALTER TABLE products_india_adjusted
RENAME TO products;

-- Understanding the dataset:
SELECT * FROM customers;
SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM products;


-- Challenge 1 :
SELECT * FROM customers;

SELECT 
	location,
    COUNT(customer_id) AS number_of_customers
FROM customers
GROUP BY location
ORDER BY number_of_customers DESC
LIMIT 3;

-- Challenge 2:
SELECT * FROM orders;

SELECT 
	NumberOfOrders, 
    COUNT(*) AS CustomerCount
FROM (
	SELECT 
		customer_id,
        COUNT(order_id) AS NumberOfOrders
	FROM Orders
    GROUP BY customer_id
) AS CustomerOrders
GROUP BY NumberOfOrders
ORDER BY NumberOfOrders ASC;

WITH CustomerOrders AS (
	SELECT 
		customer_id,
        COUNT(order_id) AS NumberOfOrders
	FROM Orders
    GROUP BY customer_id
)
SELECT 
	NumberOfOrders, 
    COUNT(*) AS CustomerCount
FROM CustomerOrders
GROUP BY NumberOfOrders
ORDER BY NumberOfOrders ASC;

-- Challenge 3 : 
SELECT * FROM order_details;

SELECT 
	Product_id,
    AVG(quantity) AS AvgQuantity,
    SUM(quantity * price_per_unit) AS TotalRevenue
FROM order_details
GROUP BY Product_id
HAVING AvgQuantity = 2
ORDER BY TotalRevenue DESC;

-- Challenge 4 :
SELECT
	p.category,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM products p 
JOIN order_details od
ON p.product_id = od.product_id
JOIN orders o
ON o.order_id = od.order_id
GROUP BY p.category
ORDER BY unique_customers DESC;

-- Challenge 5:
SELECT * FROM orders;
DESC orders;
WITH MonthlySales AS (
	SELECT
		DATE_FORMAT(order_date , '%Y-%m') As Month,
        SUM(total_amount) AS TotalSales
	FROM orders
    GROUP BY Month
)
SELECT 
	Month,
    TotalSales,
    ROUND((TotalSales - LAG(TotalSales) OVER (ORDER BY Month))
	/ (LAG(TotalSales) OVER (ORDER BY Month)) * 100,2) AS PercentChange
FROM MonthlySales;


-- Challenge 6:
SELECT * FROM orders;
DESC orders;
WITH MonthlyOrderValues AS (
	SELECT
		DATE_FORMAT(order_date , '%Y-%m') As Month,
        ROUND(AVG(total_amount),2) AS AvgOrderValue
	FROM orders
    GROUP BY Month
)
SELECT 
	Month,
    AvgOrderValue,
    ROUND((AvgOrderValue - LAG(AvgOrderValue) OVER (ORDER BY Month)),2) AS ChangeInValue
FROM MonthlyOrderValues
ORDER BY ChangeInValue DESC;

-- Challenge 7 : Inventory Refresh Rate
SELECT * FROM order_details;

SELECT
	product_id,
    COUNT(order_id) AS SalesFrequency
FROM order_details
GROUP BY product_id
ORDER BY SalesFrequency DESC
LIMIT 5;

-- Challenge 8:
SELECT
	p.Product_id,
    p.Name,
    COUNT(DISTINCT o.customer_id) AS UniqueCustomerCount
FROM Products p 
JOIN order_details od
ON p.product_id = od.product_id
JOIN orders o
ON o.order_id = od.order_id
GROUP BY p.Product_id,p.Name
HAVING UniqueCustomerCount < (SELECT COUNT(*) FROM Customers) * 0.4;

-- Challenge 9:
SELECT * FROM orders;
WITH MonthlyNewCustomers AS (
	SELECT
		customer_id,
		DATE_FORMAT(min(order_date) , '%Y-%m') AS FirstPurchaseMonth,
        COUNT(DISTINCT customer_id) AS NewCustomers
	FROM orders
    GROUP BY customer_id
)
SELECT
	FirstPurchaseMonth,
    SUM(NewCustomers) AS TotalNewCustomers
FROM MonthlyNewCustomers
GROUP BY FirstPurchaseMonth
ORDER BY FirstPurchaseMonth;

SELECT
	customer_id,
	DATE_FORMAT(min(order_date) , '%Y-%m') AS FirstPurchaseMonth,
	COUNT(DISTINCT customer_id) AS NewCustomers
FROM orders
GROUP BY customer_id;

-- Challenge 10 : Peak Sales Period Identification

SELECT * FROM Orders;

SELECT 
	DATE_FORMAT(order_date, '%Y-%m') AS Month,
    SUM(total_amount) AS TotalSales
FROM Orders
GROUP BY Month
ORDER BY TotalSales DESC
LIMIT 3;
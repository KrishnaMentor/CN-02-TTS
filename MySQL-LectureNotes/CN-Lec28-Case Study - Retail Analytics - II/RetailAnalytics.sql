CREATE DATABASE retail_analytics;
USE retail_analytics;
SHOW TABLES;

ALTER TABLE customer_profiless
rename to customers;
ALTER TABLE product_inventorys
rename to product;
ALTER TABLE sales_datas
rename to sales;

SELECT * FROM customers;
DESC customers;
SELECT * FROM product;
DESC product;
SELECT * FROM sales;
DESC sales;
SELECT COUNT(*) From Product;
SELECT COUNT(*) From Customers;
SELECT COUNT(*) From sales;

-- ï»¿CustomerID -> CustomerID
-- ï»¿ProductID -> ProductID
-- ï»¿TransactionID -> TransactionID

ALTER TABLE Customers
CHANGE ï»¿CustomerID CustomerID INT;
-- OR
ALTER TABLE Customers
RENAME COLUMN ï»¿CustomerID TO CustomerID;

ALTER TABLE Product
CHANGE ï»¿ProductID ProductID INT;
-- OR
ALTER TABLE Product
RENAME COLUMN ï»¿ProductID TO ProductID;


ALTER TABLE sales
CHANGE ï»¿TransactionID TransactionID INT;
-- OR
ALTER TABLE sales
RENAME COLUMN ï»¿TransactionID TO TransactionID;

-- Challenge 1 
SELECT 
	TransactionID,
    COUNT(*)
FROM sales
GROUP BY TransactionID
HAVING COUNT(*) > 1;

CREATE TABLE sales_unique AS 
SELECT DISTINCT * FROM sales;

DROP TABLE sales;
ALTER TABLE sales_unique RENAME TO sales;

-- CHALLENGE 2
SELECT * FROM sales;
SELECT * FROM product;

-- Discrepancies in the price
SELECT
	-- p.ProductID,
	TransactionID,
    s.Price AS TransactionPrice,
    p.Price AS InventoryPrice
FROM sales s
JOIN product p
ON s.ProductID = p.ProductID
WHERE p.price <> s.price;

-- UPDATE Price of ProductID - 51
-- UPDATE sales
-- SET Price = 93.12
-- WHERE ProductID = 51; IN (51,2,343,54,12,42,644,334)

SET SQL_SAFE_UPDATES = 0;
UPDATE sales s
SET Price = (
	SELECT p.price FROM product p 
    WHERE s.ProductID = p.ProductID 
)
WHERE s.ProductID IN (
	SELECT ProductID FROM product p
    WHERE p.price <> s.price
);

-- Challenge 3
SELECT * FROM Customers;
SELECT * FROM Customers WHERE Location LIKE "";
SELECT COUNT(*) FROM Customers WHERE Location LIKE "";
-- SELECT COUNT(*) FROM Customers WHERE Location IS NULL;

UPDATE Customers 
SET Location = "Unknown"
WHERE Location LIKE "";

UPDATE Customers 
SET Location = "Unknown"
WHERE Location IS NULL;


USE retail_analytics;
SELECT * FROM Customers;
SELECT * FROM Product;
SELECT * FROM sales;
DESC sales;

-- Challenge 4

CREATE TABLE sales_updates AS 
SELECT 
	* , 
    STR_TO_DATE(TransactionDate , "%d/%m/%y") AS TransactionDate_updated
FROM sales;

-- Platform
CREATE TABLE sales_updates AS 
SELECT 
	* , 
    CAST(TransactionDate AS DATE) AS TransactionDate_updated
FROM sales;

SELECT * FROM sales_updates;

DROP TABLE sales;

ALTER TABLE sales_updates RENAME TO sales;
SELECT * FROM sales;

-- Challenge5:
SELECT
	ProductID,
    SUM(QuantityPurchased) AS TotalUnitsSold,
    SUM(QuantityPurchased * Price) AS TotalSales
FROM sales
GROUP BY ProductID
ORDER BY TotalSales DESC;

-- Challenge 6: 
SELECT
	CustomerID,
    COUNT(*) AS NumberOfTransactions
FROM sales
GROUP BY CustomerID
ORDER BY NumberOfTransactions DESC;

-- Challenge 7:
SELECT * FROM sales;
SELECT * FROM product;

SELECT 
	p.Category,
    SUM(s.QuantityPurchased) AS TotalUnitsSold,
    SUM(s.QuantityPurchased * s.Price) AS TotalSales
FROM sales s
JOIN product p
ON s.ProductID = p.ProductID
GROUP BY Category
ORDER BY TotalSales DESC;

-- Challenge 8:

SELECT 
	ProductID,
    SUM(QuantityPurchased * Price) AS TotalRevenue
FROM sales
GROUP BY ProductID
ORDER BY TotalRevenue DESC 
LIMIT 10;

-- Challenge 9:
SELECT * FROM sales;
SELECT
	ProductID,
    SUM(QuantityPurchased) AS TotalUnitsSold
FROM sales
GROUP BY ProductID
HAVING TotalUnitsSold > 0
ORDER BY TotalUnitsSold
LIMIT 10;

-- Challenge 10:
SELECT * FROM sales;

SELECT 
	TransactionDate_updated AS DATETRANS,
    COUNT(*) AS Transaction_count,
    SUM(QuantityPurchased) AS TotalUnitsSold,
    SUM(QuantityPurchased * Price) AS TotalSales
FROM sales
GROUP BY DATETRANS
ORDER BY DATETRANS DESC;
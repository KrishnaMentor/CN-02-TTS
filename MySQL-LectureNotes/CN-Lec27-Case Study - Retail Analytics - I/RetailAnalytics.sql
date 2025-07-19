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
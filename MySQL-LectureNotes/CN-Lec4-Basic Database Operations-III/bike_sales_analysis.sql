SHOW DATABASES;
CREATE DATABASE bike_sales;
DROP DATABASE bike_sales;
USE bike_sales;
SELECT DATABASE();
SHOW TABLES;
DESC customers;
SELECT * FROM Customers;
DROP TABLE Customers;

-- Comment
/*
	Multiple Comments
    with multi line
*/

-- WHERE Clause
-- Filter ALL the Female Customers. 
SELECT 
	FirstName, 
    LastName, 
    Gender
FROM Customers
WHERE Gender = 'F'
LIMIT 10;

-- Filter All the Married Female 
SELECT 
	Prefix,
	FirstName,
    LastName,
    Gender,
    MaritalStatus
FROM Customers
WHERE Prefix = "Mrs."
LIMIT 10;
-- To check the distinct Marital Status 
SELECT Distinct MaritalStatus FROM Customers;
-- AND LOGIC [To Find the Married Female]
SELECT 
	FirstName,
    LastName,
    Gender,
    MaritalStatus
FROM Customers
WHERE Gender = 'F' AND MaritalStatus = 'M'
LIMIT 10;

-- Find Customers having TotalChildren >=2;
SELECT 
	FirstName,
    LastName,
    Gender,
    MaritalStatus,
    TotalChildren
FROM Customers
WHERE NOT TotalChildren = 4
LIMIT 10;

-- Applying Filter on Occupation & EducationLevel
SELECT 
	FirstName,
    LastName,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel LIKE "Bachelors" AND Occupation LIKE "Professional"
LIMIT 10;

SELECT 
	FirstName,
    LastName,
    MaritalStatus,
    TotalChildren
FROM Customers
WHERE MaritalStatus LIKE "M" AND TotalChildren = 0
LIMIT 10;

SELECT 
	FirstName,
    LastName,
    HomeOwner
FROM Customers
WHERE HomeOwner = 'N'
LIMIT 10;

SELECT 
	FirstName,
    LastName
FROM Customers
WHERE FirstName LIKE 'H%'
LIMIT 10;

SELECT 
	FirstName,
    LastName
FROM Customers
WHERE LastName LIKE '%S'
LIMIT 10;
	
SELECT 
	FirstName,
    LastName
FROM Customers
WHERE FirstName LIKE '%AN%'
LIMIT 10;

SELECT 
	FirstName,
    LastName
FROM Customers
WHERE LastName LIKE '%A_G'
LIMIT 10;

SELECT 
	FirstName,
    LastName
FROM Customers
WHERE FirstName LIKE '_A__E'
LIMIT 10;

-- Filter out all customer having Occupation 
-- Professional, Management, clerical.

SELECT 
	FirstName,
    Gender,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation IN ("Professional", "Management", "Clerical")
LIMIT 20;


SELECT 
	FirstName,
    Gender,
    AnnualIncome,
    Occupation,
    EducationLevel
FROM Customers
WHERE Occupation IN ("Professional", "Management", "Clerical")
AND
EducationLevel IN ("Bachelors", "Graduate Degree");

-- NOT IN
SELECT 
	FirstName,
    Gender,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation NOT IN ("Professional", "Management", "Clerical")
LIMIT 20;

-- BETWEEN
SELECT 
	FirstName,
    Gender,
    AnnualIncome,
    Occupation,
    TotalChildren
FROM Customers
WHERE TotalChildren BETWEEN 1 AND 4
LIMIT 10;

-- ORDER BY [Products]
USE bike_sales;
SELECT * FROM Products;

DESCRIBE Products; -- DESC with Table Name [Abbreviation] [Describe]

SELECT 
	ProductName,
    ModelName,
    ProductColor,
    ProductCost
FROM Products
ORDER BY ProductCost
LIMIT 10;

-- ORDER BY With Index
SELECT 
	ProductName,
    ModelName,
    ProductColor,
    ProductCost
FROM Products
ORDER BY ProductCost DESC, ProductName DESC -- DESC [With ORDER BY] [Descending]
LIMIT 10;

-- Top 10 Products based on Product Price
SELECT 
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC
LIMIT 10 OFFSET 5;

SELECT 
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC
LIMIT 20 OFFSET 5;


SELECT 
	ProductKey AS Id,
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC
LIMIT 10;

SELECT 
	CustomerKey AS CustomerID,
    CONCAT(Prefix , " " , FirstName, " ", LastName) AS CustomerName
FROM Customers
LIMIT 10;

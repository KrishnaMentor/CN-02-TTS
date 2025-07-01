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

CREATE DATABASE bike_analysis;
USE bike_analysis;

-- Importing all file once in Command line with below code.
CREATE DATABASE bike_sales_analysis;
USE bike_sales_analysis;
-- Don't forget to change '\' to '/' in file path
-- SOURCE C:/Users/krish/Documents/Lecture Notes/CN02/MySQL Lecture Notes/Dataset/sales_dataset.sql;


-- CREATE A TABLE
CREATE TABLE CodingNinja(
	user_id INT AUTO_INCREMENT, -- NOT NULL & UNIQUE
    StudentName varchar(50) NOT NULL DEFAULT 'Unknown',
    Gender char(1),
    Email varchar(100) UNIQUE,
    age int,
    IsActive Boolean,
    PRIMARY KEY(user_id)
);

-- DROP TABLE CodingNinja;
-- INSERT COMMAND
INSERT INTO CodingNinja(StudentName,Gender,age)
VALUES('Shalu Kumari','F',24);

INSERT INTO CodingNinja(IsActive,StudentName,age,Gender)
VALUES(1,"Utkarsh",29,'M');

INSERT INTO CodingNinja
VALUES(4299236,"Vaishnavi",'F','vaishnanil@gmail.com',24,1);
(5,"AKSHAY",'M','akshaykamble61@gmail.com',25,1),
(6,"Naval",'M','naval_16@gmail.com@',28,1),
(7,"Aditya",'M','aditya001@gmail.com@',22,1);

USE bike_analysis;
SHOW TABLES;
-- ALIASES AS to get a backup table
CREATE TABLE CustomerDetails AS
SELECT * FROM Customers;

-- UPDATE Command
SELECT Distinct AnnualIncome FROM CustomerDetails;

SELECT  
	FirstName,
    LastName,
    Gender,
    AnnualIncome,
    TotalChildren
FROM CustomerDetails
LIMIT 10;

UPDATE CustomerDetails
SET AnnualIncome = NULL;

UPDATE CustomerDetails
SET TotalChildren = 1
WHERE FirstName = "CHRISTY" AND LastName = "ZHU";

UPDATE CustomerDetails
SET TotalChildren = 1
WHERE MaritalStatus = 'M';

SELECT 
	CustomerKey,
    FirstName,
    LastName,
    EmailAddress,
    TotalChildren
FROM CustomerDetails
WHERE LastName = "Mehta"
LIMIT 25;

UPDATE CustomerDetails
SET EmailAddress = "mehta@learnsector.com"
WHERE lastName = "Mehta";

-- DELETE
DELETE FROM CustomerDetails
WHERE lastName = "Mehta";

-- Removes only Data not structure [DELETE WITHOUT WHERE CLAUSE]
DELETE FROM CustomerDetails;

-- DROP
DROP TABLE CustomerDetails;

-- ALIASES AS to get a backup table
CREATE TABLE CustomerDetails AS
SELECT * FROM Customers;

-- TRUNCATE [DDL]
TRUNCATE TABLE CustomerDetails;

-- IS NULL / IS NOT NULL VS Empty = ""
SELECT
	CustomerKey,
    FirstName,
    LastName,
    AnnualIncome 
FROM Customers
WHERE AnnualIncome = "";


UPDATE Customers
SET AnnualIncome = NULL
WHERE AnnualIncome = "";

SELECT
	CustomerKey,
    FirstName,
    LastName,
    AnnualIncome 
FROM Customers
WHERE AnnualIncome IS NULL;

SELECT
	CustomerKey,
    FirstName,
    LastName,
    AnnualIncome 
FROM Customers
WHERE AnnualIncome IS NULL;

SELECT
	CustomerKey,
    FirstName,
    LastName,
    AnnualIncome 
FROM Customers
WHERE AnnualIncome IS NOT NULL
LIMIT 10;

-- FIXING Prefix having "" -> replace with NULL
SELECT
	CustomerKey,
    Prefix,
    FirstName,
    LastName
FROM Customers
WHERE Prefix = "";

UPDATE Customers
SET Prefix = NULL 
WHERE Prefix = "";

SELECT
	CustomerKey,
    Prefix,
    FirstName,
    LastName
FROM Customers
WHERE Prefix IS NULL;

-- ADDING A NEW COLUMN NAME Country IN CustomerTable
-- Adding a column at end
ALTER TABLE Customers
ADD COLUMN Country VARCHAR(50);

-- Dropping Country Column to Teach multiple option of Add Column
ALTER TABLE Customers
DROP Column Country;

-- Adding a column at beginning 
ALTER TABLE Customers
ADD COLUMN Country VARCHAR(50) FIRST;

-- Adding a column at specific location 
ALTER TABLE Customers
ADD COLUMN Country VARCHAR(50)
AFTER BirthDate;

-- DROP Column Name MyUnknownColumn which is an unnecessary column
ALTER TABLE Customers
DROP Column MyUnknownColumn;

-- MODIFY The Column Datatype
ALTER TABLE Customers
MODIFY COLUMN EmailAddress VARCHAR(100);

ALTER TABLE Customers
MODIFY COLUMN Phone_number TEXT;

-- RENAME COLUMN BirthDate - DateOfBirth
ALTER TABLE Customers
RENAME COLUMN BirthDATE TO DateOfBirth;

-- STRING Operations
-- Length
SELECT LENGTH('Coding Ninja');

SELECT 
	CustomerKey,
	FirstName,
    LENGTH(FirstName) AS firstName_length
FROM Customers
LIMIT 10;

-- TRIM
SELECT TRIM(BOTH 'x' FROM 'xxxxxCodingNinjasxxxxxx') AS trimmed_string;

SELECT TRIM('-' FROM TRIM('x' FROM 'xxxxxCodingNinjas------')) AS trimmed_string;

SELECT LTRIM('          codingNinjas') AS left_trimmed;

SELECT RTRIM('          codingNinjas           ') AS right_trimmed;

SELECT TRIM('          codingNinjas           ') AS trimmed_string;

-- CONCAT similar to Concatenate() in Excel
SELECT
	FirstName, 
    LastName,
    CONCAT(FirstName," ",LastName) AS FullName
FROM Customers
LIMIT 10;

-- CONCAT_WS() -- it is similar to textjoin()
SELECT
	Prefix,
	FirstName, 
    LastName,
    CONCAT_WS(" - ",Prefix,FirstName,LastName) AS FullName
FROM Customers
LIMIT 10;

-- Challenge to Create a new Column FullName, making it update with Concat 
-- and drop the reference column[FirstName,LastName]
ALTER TABLE Customers
ADD COLUMN FullName Varchar(100)
AFTER LastName;

UPDATE Customers
SET FullName = CONCAT(FirstName,' ',LastName);

SELECT FullName From Customers LIMIT 10;

ALTER TABLE Customers
DROP COLUMN FirstName, DROP COLUMN LastName;

-- SUBSTRING_INDEX - To fetch the FirstName, LastName from FullName Column

ALTER TABLE Customers
ADD Column FirstName Varchar(50)
AFTER Prefix;

ALTER TABLE Customers
ADD Column LastName Varchar(50)
AFTER FirstName;

SELECT FirstName,LastName FROM Customers LIMIT 10;

UPDATE Customers
SET FirstName = SUBSTRING_INDEX(FullName,' ',1);

UPDATE Customers
SET LastName = SUBSTRING_INDEX(FullName,' ',-1);

SELECT DISTINCT Upper(Occupation) FROM Customers;

SELECT 
	CONCAT(LOWER(FirstName),' ',LOWER(LastName)) AS FullName
FROM Customers
LIMIT 10;

SELECT 
	LOWER(CONCAT(FirstName,' ',LastName)) AS FullName
FROM Customers
LIMIT 10;

SELECT 
	CustomerKey,
    FirstName,
    LastName,
    EmailAddress,
	LEFT(EmailAddress,7) AS trimmed_address
FROM Customers
LIMIT 10;

SELECT 
	CustomerKey,
    FirstName,
    LastName,
    EmailAddress,
	RIGHT(EmailAddress,4) AS trimmed_address
FROM Customers
LIMIT 10;

-- LPAD / RPAD(str,Length,padded_str)

SELECT 
	LPAD(Phone_number,10,'0') AS formatted_number
FROM Customers
LIMIT 15;

SELECT 
	RPAD(Phone_number,10,'0') AS formatted_number
FROM Customers
LIMIT 15;

SELECT 
	CONCAT('(+1)', RPAD(Phone_number,10,'0')) AS formatted_number
FROM Customers
LIMIT 15;

-- REVERSE()
SELECT
	FirstName,
	REVERSE(FirstName),
    CONCAT(FirstName,Reverse(FirstName)) AS Palindrome_string
FROM Customers
LIMIT 5;

-- REPLACE
SELECT
	ProductName,
    ProductStyle,
    REPLACE(ProductStyle,'0','NA') AS ReplacedColumn
FROM Products
WHERE ProductStyle LIKE '0';

-- Updating the AnnualIncome, replacing $ & , with "" -> ALTER Command to modify the data types.

UPDATE Customers
SET AnnualIncome = REPLACE(AnnualIncome,'$',''); -- $170,000 -> 170,000

UPDATE Customers
SET AnnualIncome = REPLACE(AnnualIncome,',',''); -- 170,000 -> 1700000

UPDATE Customers
SET AnnualIncome = REPLACE(REPLACE(AnnualIncome,'$',''),',',''); 

-- Now its a best time to change the data type of AnnualIncome

ALTER TABLE Customers
MODIFY COLUMN AnnualIncome INT;

SELECT 
	AnnualIncome,
    CAST(AnnualIncome AS DECIMAL(15,2)) AS CastedAnnualIncome
FROM Customers
LIMIT 10;

ALTER TABLE Customers
MODIFY COLUMN AnnualIncome TEXT;

SELECT 
	AnnualIncome,
    CAST(AnnualIncome AS DECIMAL(10,2)) AS CastedAnnualIncome
FROM Customers
LIMIT 10;

SELECT 
	DISTINCT ReturnDate
FROM Returns LIMIT 10;

SELECT
	ReturnDate,
    CAST(ReturnDate AS DATE) AS new_return_date
FROM Returns
LIMIT 10;

-- YYYY-MM-DD [Default Date Format]

SELECT
	ReturnDate,
    STR_TO_DATE(ReturnDate, '%c/%e/%Y') AS new_return_date
FROM Returns
LIMIT 10;

-- 1/18/2015 [Month-Date-Year] [m/d/yyyy]
-- 2/2/2015 [single digit month/single digit date/ 4 digit year]

-- SUBSTRING

SELECT SUBSTRING('Coding Ninja',5,5);
SELECT SUBSTR('Coding Ninja',1,6);

SELECT 
	EmailAddress,
    SUBSTR(EmailAddress,-10,10)
FROM Customers
LIMIT 10;

SELECT 
	EmailAddress,
    INSTR(EmailAddress,'@') AS `@_position`,
    INSTR(EmailAddress,'.') AS `dot-position`,
    LENGTH(EmailAddress) AS text_length
FROM Customers
LIMIT 10;

SELECT 
	EmailAddress,
    LEFT(EmailAddress,INSTR(EmailAddress,'@')-1) AS UserName,
    SUBSTR(EmailAddress,INSTR(EmailAddress,'@')+1) AS DomainName,
    RIGHT(EmailAddress,LENGTH(EmailAddress)-INSTR(EmailAddress,'@')) AS New_DomainName,
    INSTR(EmailAddress,'@') AS `@_position`,
    LENGTH(EmailAddress) AS text_length
FROM Customers
LIMIT 10;

USE bike_analysis;
-- Count()
-- Count the number of unique products sell on 2015/16/17

SELECT	
	Count(DISTINCT ProductKey)
FROM `sales-2015`;
SELECT	
	Count(DISTINCT ProductKey)
FROM `sales-2016`;
SELECT	
	Count(DISTINCT ProductKey)
FROM `sales-2017`;

-- Count the unique products having productCost  > 1000;
SELECT
	Count(productKey)
From Products
WHERE ProductCost > 1000;

SELECT
	 Count(DISTINCT ProductSubcategoryKey)
FROM Products;

-- Calculate the Sum of Product Price, Sum of Product Cost, Total Gross Profit,

SELECT
	CAST(SUM(ProductPrice)AS DECIMAL(10,2)) AS TotalSales,
    ROUND(SUM(ProductCost),2) AS TotalCost,
    ROUND(SUM(ProductPrice - ProductCost),2) AS GrossProfit
FROM Products;

-- Find the TotalSales/Cost/Profit for Each ProductSubcategoryKey.

SELECT
	ProductSubcategoryKey,
	CAST(SUM(ProductPrice)AS DECIMAL(10,2)) AS TotalSales,
    ROUND(SUM(ProductCost),2) AS TotalCost,
    ROUND(SUM(ProductPrice - ProductCost),2) AS GrossProfit
FROM Products
GROUP BY ProductSubcategoryKey
ORDER BY GrossProfit DESC;

-- Group_Concat()
SELECT
	GROUP_CONCAT(DISTINCT EducationLevel)
FROM Customers;

SELECT
	GROUP_CONCAT(DISTINCT Occupation SEPARATOR ' - ')
FROM Customers;
SELECT
	GROUP_CONCAT(DISTINCT SubCategoryName ORDER BY SubCategoryName SEPARATOR ' # '  ) AS SubcategoryList
FROM `product-subcategories`;

SELECT
	GROUP_CONCAT(DISTINCT CategoryName SEPARATOR ' -> '  ) AS CategoryList
FROM `product-categories`;

-- Counting the number of customer in each occupation
SELECT
	Occupation,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
GROUP BY Occupation;

-- Counting the number of customer in each educationLevel
SELECT
	EducationLevel,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
GROUP BY EducationLevel;

-- Counting the number of customer in each occupation, educationLevel
SELECT
	EducationLevel, 
    Occupation,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
GROUP BY 1,2;

-- HAVING CLAUSE
SELECT
	Occupation,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
WHERE Occupation NOT LIKE "Clerical"
GROUP BY Occupation
Having CustomersCount > 300;

SELECT
	Occupation,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
WHERE Occupation NOT LIKE "Clerical"
GROUP BY 1
Having CustomersCount > 300
ORDER BY 1;

-- Find the Total AnnualIncome based on Occupation / Education / Gender.
SELECT
	Occupation,
    SUM(AnnualIncome) AS TotalIncome
FROM Customers
GROUP BY 1;

SELECT
	EducationLevel,
    SUM(AnnualIncome) AS TotalIncome
FROM Customers
GROUP BY 1;

SELECT
	Gender,
    SUM(AnnualIncome) AS TotalIncome
FROM Customers
GROUP BY 1;

-- Find the Total AnnualIncome based on Occupation - Education where Gender = "Male".
SELECT
	Occupation,
	EducationLevel,
    SUM(AnnualIncome) AS TotalIncome
FROM Customers
WHERE Gender = 'M'
GROUP BY 1,2;

-- Find the AvgCost ,AvgPrice, AvgProfit having AvgProfit > 100 based on each ProductSubcategoryKey.

SELECT 
	ProductSubcategoryKey,
    ROUND(AVG(ProductCost),0) AS AvgCost,
    ROUND(AVG(ProductPrice),0) AS AvgPrice,
    ROUND(ABS(AVG(ProductCost - ProductPrice)),0) AS AvgProfit
FROM Products
GROUP BY 1
HAVING AvgProfit > 100;

SELECT
	Gender,
	EducationLevel, 
    Occupation,
    COUNT(CustomerKey) AS CustomersCount
FROM Customers
GROUP BY 1,2,3
ORDER BY 1;

SHOW TABLES;
DROP TABLE customerDetail;
DESC Customers;
DESC `sales-2015`;	

CREATE TABLE Customer(
	Customer_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    age INT
);
INSERT INTO Customer(Customer_id,age)
VALUE(123,29);

ALTER TABLE Customer
MODIFY COLUMN customer_name VARCHAR(100) DEFAULT 'NA';

DESC Customer;
SELECT * FROM Customer;

ALTER TABLE Customer
ADD PRIMARY KEY(Customer_id);

CREATE TABLE Orders(
	order_id INT PRIMARY KEY,
    Customer_id INT,
    FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id)
    -- ON DELETE CASCADE
    -- ON UPDATE CASCADE
);
-- CASCADE,SET NULL, SET DEFAULT, RESTRICT, NO ACTION
DESC Orders;
DESC Customer;
ALTER TABLE Customer
ADD COLUMN EmailAddress VARCHAR(50) AFTER Customer_name,
ADD COLUMN Phone_number BIGINT;

ALTER TABLE Customer
ADD CONSTRAINT UNIQUE(EmailAddress);

ALTER TABLE Customer
DROP CONSTRAINT EmailAddress;

ALTER TABLE Customer
ADD CONSTRAINT UNIQUE(Phone_number);

ALTER TABLE Orders
DROP COLUMN Customer_id;

ALTER TABLE Orders
DROP CONSTRAINT orders_ibfk_1;

-- Error Code: 1828. Cannot drop column 'Customer_id': needed in a foreign key constraint 
-- 'orders_ibfk_1'

ALTER TABLE Orders
ADD Column Customer_id INT;

-- ADD [CONSTRAINT [symbol]] FOREIGN KEY
--     [index_name] (col_name,...)
--        reference_definition

ALTER TABLE Orders
ADD Constraint fk_customer_id
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);



DESC Orders;

DESC Customer;
ALTER TABLE Customer
DROP COLUMN customer_id;

-- Error Code: 1829. Cannot drop column 'Customer_id': needed in a foreign key constraint 
-- 'fk_customer_id' of table 'orders'

ALTER TABLE Orders
DROP Constraint fk_customer_id;

ALTER TABLE Orders
DROP Column customer_id;

DESC Orders;

SHOW TABLES;

DESC Customer;

ALTER TABLE Customer
ADD COLUMN customer_id INT
FIRST;

ALTER TABLE Customer
ADD PRIMARY KEY(customer_id);

DESC Customer;
SELECT * FROM Customer;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customer
SET customer_id = 1
WHERE customer_id IS NULL;

DESC Orders;

-- CHECK Constraint
DESC Products;

ALTER TABLE Products
ADD CONSTRAINT check_positive_cost
CHECK (ProductCost > 0);

INSERT INTO Products(ProductCost)
VALUES(-10);

-- Error Code: 3819. Check constraint 'check_positive_cost' is violated.

-- Adding Constraint on Return Quantity >0

DESC Returns;

ALTER TABLE Returns
ADD CONSTRAINT check_return_quantity
CHECK (ReturnQuantity > 0);

INSERT INTO Returns(ReturnQuantity)
VALUES(-1);

-- Error Code: 3819. Check constraint 'check_return_quantity' is violated.

-- JOIN [INNER JOIN / JOIN]
SELECT 
	p.ProductKey,
	p.ProductName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Products AS p
INNER JOIN Returns AS r
ON p.ProductKey = r.ProductKey
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 10;

-- Error Code: 1052. Column 'ProductKey' in field list is ambiguous

-- Find the products who never being returned.

SELECT 
	p.ProductKey,
	p.ProductName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Products AS p
LEFT JOIN Returns AS r
ON p.ProductKey = r.ProductKey
GROUP BY 1,2
HAVING TotalReturns IS NULL;

-- Find the products who are returned.
SELECT 
	p.ProductKey,
	p.ProductName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Products AS p
LEFT JOIN Returns AS r
ON p.ProductKey = r.ProductKey
GROUP BY 1,2
HAVING TotalReturns IS NOT NULL;

-- Finding the products which are not returned. [via return table]
SELECT 
	p.ProductKey,
	p.ProductName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM returns AS r
RIGHT JOIN Products AS p
ON p.ProductKey = r.ProductKey
GROUP BY 1,2;

DESC Returns;

SELECT * FROM Returns
WHERE ReturnDate IS NULL;
INSERT INTO Returns(ProductKey,ReturnQuantity)
VALUES(999991,1),
(999992,2),
(999993,3),
(999994,4),
(999995,5),
(999996,6),
(999997,7),
(999998,8),
(999999,9);

SELECT 
	p.ProductKey,
    r.returnQuantity
FROM Products p
RIGHT JOIN returns r
ON p.ProductKey = r.ProductKey
WHERE p.productKey IS NULL;

USE bike_analysis;
-- territories not present on returns table
SELECT * FROM territories;

SELECT DISTINCT(TerritoryKey) FROM returns;

SELECT
	t.SalesTerritoryKey,
    t.Region,
    t.Country,
    SUM(r.returnQuantity) AS TotalReturns
FROM territories t
RIGHT JOIN returns r 
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3;

-- FULL JOIN 

SELECT t.*, r.*
FROM territories t
LEFT JOIN returns r 
ON t.SalesTerritoryKey = r.TerritoryKey
UNION
SELECT t.*, r.*
FROM territories t
RIGHT JOIN returns r 
ON t.SalesTerritoryKey = r.TerritoryKey;

DESC `sales-2015`;
-- CHALLENGES ON JOINS

SELECT
	CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    ProductName,
    SUM(s.orderQuantity) AS TotalQty
FROM (
	SELECT * FROM `sales-2015`
    UNION ALL
    SELECT * FROM `sales-2016`
    UNION ALL
    SELECT * FROM `sales-2017`
) AS s
JOIN Customers c 
ON c.CustomerKey = s.CustomerKey 
JOIN Products p
ON p.ProductKey = s.ProductKey
GROUP BY 1,2
ORDER BY 3 DESC; 

SELECT Count(DISTINCT ProductKey) FROM `sales-2015`;
SELECT Count(DISTINCT ProductKey) FROM `sales-2016`;
SELECT Count(DISTINCT ProductKey) FROM `sales-2017`; 

SELECT DISTINCT ProductName
FROM Products p 
WHERE p.ProductKey IN (SELECT ProductKey FROM `sales-2015`) 
AND p.ProductKey IN (SELECT ProductKey FROM `sales-2016`)
AND p.ProductKey IN (SELECT ProductKey FROM `sales-2017`);  

-- NOT RECOMMENDED
SELECT
    DISTINCT ProductName
FROM `sales-2015` s2015
JOIN `sales-2016` s2016
ON s2015.ProductKey = s2016.ProductKey
JOIN `sales-2017` s2017
ON s2016.ProductKey = s2017.ProductKey
JOIN Products p 
ON s2017.ProductKey = p.ProductKey;

-- CROSS JOIN 
SELECT pc.categoryName, ps.subcategoryName FROM 
`product-categories` pc
CROSS JOIN `product-subcategories` ps;

SELECT COUNT(*) FROM `product-subcategories`;


-- SELF JOIN
SELECT 
	c1.customerKey AS customer1_ID,
    CONCAT(c1.FirstName, ' ', c1.LastName) AS Customer1_Name,
    c2.customerKey AS customer2_ID,
    CONCAT(c2.FirstName, ' ', c2.LastName) AS Customer2_Name,
    c1.LastName
FROM Customers c1
JOIN Customers c2
ON c1.LastName = c2.LastName
AND c1.customerKey < c2.customerKey;

-- Find the Product Detail by connecting it from sales and returns table
SELECT
	p.ProductName,
    ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalSales,
    SUM(r.ReturnQuantity) AS TotalReturns,
    SUM(s.OrderQuantity) AS QuantitySold
FROM Products p 
JOIN `sales-2016` s
ON p.ProductKey = s.ProductKey
JOIN returns r
ON p.productKey = r.ProductKey
GROUP BY 1;

SELECT * FROM `sales-2016`;

-- Provide the detail of categoryname with total returns.

SELECT
	CategoryName,
    SUM(ReturnQuantity) AS TotalReturns
FROM `product-categories` pc 
JOIN `product-subcategories` ps
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN returns r
ON r.ProductKey = p.ProductKey
GROUP BY 1;

USE bike_analysis;
DESC Customers;

SELECT DISTINCT AnnualIncome FROM Customers;

SELECT 
	CustomerKey, 
	FullName, 
    Occupation, 
    COALESCE(AnnualIncome,0) AS AnnualIncome
FROM Customers;

SELECT COUNT(*) FROM Customers WHERE AnnualIncome IS NULL;

SHOW TABLES;

-- Calculate the Totalreturns by categoryName, SubcategoryName.
SELECT
	pc.CategoryName,
    ps.SubcategoryName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM `product-categories` pc 
JOIN `product-subcategories` ps
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p 
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Returns r 
ON p.ProductKey = r.ProductKey
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 10;

SELECT * FROM territories;
SELECT DISTINCT TerritoryKey FROM returns;

SELECT 
	t.SalesTerritoryKey,
    t.region,
    t.Country,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM territories AS t
JOIN returns AS r
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3
HAVING TotalReturns > 200;

-- Find the CategoryName with TotalExpenses, TotalSales & TotalProfit 
SELECT
	pc.CategoryName,
    ROUND(SUM(p.ProductCost * s.OrderQuantity),0) AS TotalExpenses,
    ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalSales,
    ROUND((SUM(p.ProductPrice * s.OrderQuantity) - SUM(p.ProductCost * s.OrderQuantity)),0) AS TotalProfit,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM(
	SELECT * FROM `sales-2015` 
    UNION ALL
    SELECT * FROM `sales-2016` 
    UNION ALL
    SELECT * FROM `sales-2017` 
) s 
JOIN Products p 
ON s.ProductKey = p.ProductKey
JOIN `product-subcategories` ps
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
JOIN `product-categories` pc 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Returns r 
ON p.ProductKey = r.ProductKey
GROUP BY pc.CategoryName;
DESC Customers;
DESC `sales-2015`;
-- Top 5 customers with sales quantity XXXXXXXX

SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s2015.OrderQuantity) AS TotalSalesQty
FROM `sales-2015` s2015
JOIN Customers c
ON s2015.CustomerKey = c.CustomerKey
GROUP BY 1,2
UNION ALL
SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s2016.OrderQuantity) AS TotalSalesQty
FROM `sales-2016` s2016
JOIN Customers c
ON s2016.CustomerKey = c.CustomerKey
GROUP BY 1,2
UNION ALL
SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s2017.OrderQuantity) AS TotalSalesQty
FROM `sales-2017` s2017
JOIN Customers c
ON s2017.CustomerKey = c.CustomerKey
GROUP BY 1,2
ORDER BY TotalSalesQty DESC 
LIMIT 5;

-- APPENDED TABLE
SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s.OrderQuantity) AS TotalSalesQty
FROM(
	SELECT * FROM `sales-2015` 
    UNION ALL
    SELECT * FROM `sales-2016` 
    UNION ALL
    SELECT * FROM `sales-2017` 
) s 
JOIN Customers c
ON s.CustomerKey = c.CustomerKey
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 5;

-- CASE STATEMENT
DESC Customers;
SELECT DISTINCT AnnualIncome FROM Customers;

-- Creating a new column name income_category -> <50K [Low Income] , BETWEEN 50k to 100K [Moderate Income] 
-- Else High Income.

SELECT 
	CustomerKey,
	AnnualIncome,
    CASE
		WHEN AnnualIncome IS NULL THEN 'Not Available'
		WHEN AnnualIncome < 50000 THEN 'Low Income'
        WHEN AnnualIncome BETWEEN 50000 AND 100000 THEN 'Moderate Income'
        ELSE 'High Income'
    END AS IncomeCategory
FROM Customers;

DESC Customers;
SELECT DISTINCT EducationLevel FROM Customers;

-- Bachelors
-- Partial College
-- High School
-- Partial High School
-- Graduate Degree


SELECT 
	CustomerKey,
	EducationLevel,
    CASE
		WHEN EducationLevel IN ("High School", "Partial High School") THEN "High School"
		WHEN EducationLevel IN ("Partial College", "Bachelors") THEN "Bachelors"
        ELSE 'Graduate Degree'
    END AS NewEducationLevel
FROM Customers;


-- UPDATE THE IncomeCategory in Customer Table.
ALTER TABLE Customers
ADD COLUMN IncomeCategory VARCHAR(100)
AFTER AnnualIncome;
SELECT * FROM Customers;
DESC Customers;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET IncomeCategory = CASE
	WHEN AnnualIncome IS NULL THEN 'Not Available'
	WHEN AnnualIncome < 50000 THEN 'Low Income'
	WHEN AnnualIncome BETWEEN 50000 AND 100000 THEN 'Moderate Income'
	ELSE 'High Income' 
END;

/* Find the territorykey wise orderquantity:
    1. OrderQty > 2 -> High Sales
    2. OrderQty [1,2] Inclusive -> Medium Sales
    3. OrderQty < 1 -> Low Sales
*/

SELECT 
	TerritoryKey,
    SUM(CASE WHEN OrderQuantity>2 THEN OrderQuantity ELSE 0 END) AS HighSales,
    SUM(CASE WHEN OrderQuantity BETWEEN 1 AND 2 THEN OrderQuantity ELSE 0 END) AS MediumSales,
    SUM(CASE WHEN OrderQuantity < 1 THEN OrderQuantity ELSE 0 END) AS LowSales
FROM `sales-2017`
GROUP BY 1;


/* Find the territorykey wise orderquantity:
    1. OrderQty > 3 -> High Sales
    2. OrderQty [2,3] Inclusive -> Medium Sales
    3. OrderQty < 2 -> Low Sales
*/

SELECT 
	TerritoryKey,
    SUM(CASE WHEN OrderQuantity>3 THEN OrderQuantity ELSE 0 END) AS HighSales,
    SUM(CASE WHEN OrderQuantity BETWEEN 2 AND 3 THEN OrderQuantity ELSE 0 END) AS MediumSales,
    SUM(CASE WHEN OrderQuantity < 2 THEN OrderQuantity ELSE 0 END) AS LowSales
FROM `sales-2017`
GROUP BY 1;

SELECT * FROM Territories;

-- Classify the customer based on how frequently they return product. 
SELECT
	c.CustomerKey,
    c.FullName,
    SUM(COALESCE(r.ReturnQuantity,0)) AS TotalReturns,
    CASE
		WHEN SUM(COALESCE(r.ReturnQuantity,0)) > 10 THEN 'Frequent Returner'
        WHEN SUM(COALESCE(r.ReturnQuantity,0)) BETWEEN 1 AND 10 THEN 'Occasional Returner'
        ELSE 'Non-Returner'
    END AS ReturnBehaviour
FROM Customers c
LEFT JOIN `sales-2015` s 
ON c.CustomerKey = s.CustomerKey 
LEFT JOIN returns r 
ON r.ProductKey = s.ProductKey
GROUP BY 1,2
ORDER BY 3 DESC;

SELECT DISTINCT CategoryName FROM `product-categories`;

-- - Show the Total return quantity for Each Product Category break down by region.
SELECT 
	Region,
    SUM(CASE WHEN CategoryName = "Bikes" THEN returnQuantity ELSE 0 END ) AS BikeReturns,
    SUM(CASE WHEN CategoryName = "Clothing" THEN returnQuantity ELSE 0 END ) AS ClothingReturns,
    SUM(CASE WHEN CategoryName = "Accessories" THEN returnQuantity ELSE 0 END ) AS AccessoriesReturns,
    SUM(CASE WHEN CategoryName = "Components" THEN returnQuantity ELSE 0 END ) AS ComponentsReturns
FROM `product-categories` pc 
JOIN `product-subcategories` ps
ON ps.ProductCategoryKey = pc.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN returns r 
ON r.ProductKey = p.ProductKey
JOIN territories t
ON r.TerritoryKey = t.SalesTerritoryKey
GROUP BY 1;

-- Another CASE Query
SELECT 
	Region,
    CategoryName,
    SUM(ReturnQuantity) AS TotalReturns,
    CASE
		WHEN SUM(ReturnQuantity) > 50 THEN 'High Returns'
        WHEN SUM(ReturnQuantity) > 25 THEN 'Moderate Returns'
        ELSE 'Low Returns'
    END AS ReturnCategory
FROM `product-categories` pc 
JOIN `product-subcategories` ps
ON ps.ProductCategoryKey = pc.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN returns r 
ON r.ProductKey = p.ProductKey
JOIN territories t
ON r.TerritoryKey = t.SalesTerritoryKey
GROUP BY 1,2;

-- USE OF CTE to make query optimize and easy to understand.......... 

-- Find the CategoryName with TotalExpenses, TotalSales & TotalProfit 
WITH CategoryInfo AS (
	SELECT
		pc.CategoryName,
		ROUND(SUM(p.ProductCost * s.OrderQuantity),0) AS TotalExpenses,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalSales,
		SUM(r.ReturnQuantity) AS TotalReturns
    FROM(
		SELECT * FROM `sales-2015` 
	) s 
	JOIN Products p 
	ON s.ProductKey = p.ProductKey
	JOIN `product-subcategories` ps
	ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
	JOIN `product-categories` pc 
	ON pc.ProductCategoryKey = ps.ProductCategoryKey
	JOIN Returns r 
	ON p.ProductKey = r.ProductKey
	GROUP BY pc.CategoryName
)

SELECT *,(TotalSales - TotalExpenses) AS TotalProfit
FROM CategoryInfo;


-- ROUND((SUM(p.ProductPrice * s.OrderQuantity) - SUM(p.ProductCost * s.OrderQuantity)),0) AS TotalProfit,

USE bike_analysis;

SELECT Avg(ProductCost) FROM Products;
DESC Products;

-- Find the Products having cost more than the average cost in their subcategory?
WITH AvgCostPerSubcategory AS(
	SELECT 
		ProductSubcategoryKey,
        ROUND(AVG(ProductCost),0) AS AvgCost
	FROM Products
    GROUP BY 1
)
SELECT 
	p.ProductKey,
	p.ProductName,
    p.ProductCost,
    ps.AvgCost
FROM Products p
JOIN AvgCostPerSubcategory ps 
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
WHERE p.ProductCost > ps.AvgCost
ORDER BY p.ProductCost DESC;

-- Calculate the Total Sales & Total Returns for Each product Category
WITH CategoryReturns AS(
	SELECT 
		CategoryName,
		SUM(ReturnQuantity) AS TotalReturns
	FROM returns r
    JOIN Products p
    ON r.ProductKey = p.ProductKey
    JOIN `product-subcategories` ps 
    ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
    JOIN `product-categories` pc 
    ON pc.ProductCategoryKey = ps.ProductCategoryKey
    GROUP BY 1
),
CategorySales AS(
	SELECT 
		CategoryName,
		ROUND(SUM(OrderQuantity * ProductPrice),0) AS TotalSales
	FROM `Sales-2017` s
    JOIN Products p
    ON s.ProductKey = p.ProductKey
    JOIN `product-subcategories` ps 
    ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
    JOIN `product-categories` pc 
    ON pc.ProductCategoryKey = ps.ProductCategoryKey
    GROUP BY 1
)
SELECT 
	cs.CategoryName,
    cr.TotalReturns,
    cs.TotalSales
FROM CategoryReturns cr
JOIN CategorySales cs
ON cr.CategoryName = cs.CategoryName;



SELECT 
	CategoryName,
	SUM(ReturnQuantity) AS TotalReturns
FROM returns r
JOIN Products p
ON r.ProductKey = p.ProductKey
JOIN `product-subcategories` ps 
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
JOIN `product-categories` pc 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
GROUP BY 1;

SELECT 
	CategoryName,
	ROUND(SUM(OrderQuantity * ProductPrice),0) AS TotalSales
FROM `Sales-2017` s
JOIN Products p
ON s.ProductKey = p.ProductKey
JOIN `product-subcategories` ps 
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
JOIN `product-categories` pc 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
GROUP BY 1;


-- Rephrase the below code to CTE
SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s.OrderQuantity) AS TotalSalesQty
FROM(
	SELECT * FROM `sales-2015` 
    UNION ALL
    SELECT * FROM `sales-2016` 
    UNION ALL
    SELECT * FROM `sales-2017` 
) s 
JOIN Customers c
ON s.CustomerKey = c.CustomerKey
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 5;

WITH AppendSales AS (
	SELECT * FROM `sales-2015` 
    UNION ALL
    SELECT * FROM `sales-2016` 
    UNION ALL
    SELECT * FROM `sales-2017` 
)
SELECT
	c.CustomerKey,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    SUM(s.OrderQuantity) AS TotalSalesQty
FROM AppendSales s
JOIN Customers c
ON s.CustomerKey = c.CustomerKey
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 5;


-- -> Find the each subcategoryName with average Product Cost.
SELECT 
	SubcategoryName,
    ROUND(AVG(ProductCost),0) AS AvgCost
FROM Products p
JOIN `product-subcategories` ps 
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
GROUP BY 1;

SELECT AVG(ProductCost) FROM Products;

SELECT SubcategoryName, (
	SELECT ROUND(AVG(ProductCost),0) 
	FROM Products p 
    WHERE p.ProductSubcategoryKey = ps.ProductSubcategoryKey
) AS AvgCost
FROM `product-subcategories` ps 
ORDER BY AvgCost DESC;

-- -> Find the each region with total return Qty.
SELECT 
	region,
    SUM(ReturnQuantity) AS TotalReturns
FROM territories t
LEFT JOIN returns r
ON r.TerritoryKey = t.SalesTerritoryKey
GROUP BY 1
ORDER BY TotalReturns DESC;

SELECT region, (
	SELECT SUM(ReturnQuantity)
	FROM returns r 
    WHERE r.TerritoryKey = t.SalesTerritoryKey
) AS TotalReturns
FROM territories t
ORDER BY TotalReturns DESC;

USE bike_analysis;
SELECT DISTINCT ProductSubcategoryKey , SubcategoryName FROM `product-subcategories`;
SELECT DISTINCT ProductName,ProductCost FROM Products WHERE ProductSubcategoryKey = 1;
SELECT 
	s.ProductKey,
	ROUND(SUM(s.OrderQuantity * p.ProductPrice),0) AS TotalRevenue
FROM `sales-2017` s
JOIN Products p 
ON p.ProductKey = s.ProductKey
GROUP BY s.ProductKey;
-- List top 10 products by its Total Revenue.
SELECT
	p.ProductKey,
    p.ProductName,
    sub.TotalRevenue
FROM Products p , 
(
	SELECT 
		s.ProductKey,
        ROUND(SUM(s.OrderQuantity * p.ProductPrice),0) AS TotalRevenue
	FROM `sales-2017` s
    JOIN Products p 
    ON p.ProductKey = s.ProductKey
    GROUP BY s.ProductKey
) sub
WHERE p.ProductKey = sub.ProductKey
ORDER BY sub.TotalRevenue DESC 
LIMIT 10;

DESC Products;
-- Find the products that are returned more than 50 times.
SELECT
	ProductName,
    ModelName,
    ProductPrice
FROM Products p 
WHERE (
	SELECT 
		SUM(ReturnQuantity)
	FROM Returns r 
    WHERE r.ProductKey = p.ProductKey
) > 50;
    
SELECT
	ProductName,
    ModelName,
    ProductPrice,
    SUM(ReturnQuantity) AS TotalReturns
FROM Products p
JOIN returns r 
ON p.ProductKey = r.ProductKey
GROUP BY 1,2,3
HAVING TotalReturns > 50;

-- Find the products whose productPrice > avgPrice within the subcategory
SELECT
	ProductName,
    ModelName,
    ProductPrice
FROM Products p 
WHERE ProductPrice > (
	SELECT 
		AVG(ProductPrice) 
	FROM Products p2
    WHERE p.ProductSubcategoryKey = p2.ProductSubcategoryKey
);

SELECT
	ProductSubcategoryKey,
	ROUND(AVG(ProductPrice),0) AS AvgPrice
FROM Products
GROUP BY 1;

SELECT * FROM Products;
SELECT AVG(ProductPrice) FROM Products;

SELECT
	ProductName,
    ModelName,
    ProductPrice
FROM Products p 
WHERE ProductPrice > (
	SELECT 
		AVG(ProductPrice) 
	FROM Products p2
    WHERE p.ProductSubcategoryKey = p2.ProductSubcategoryKey
);

-- Find the products which are returned more than average return Qty. 
SELECT
	p.ProductName, 
	SUM(r.ReturnQuantity) AS total_return_quantity
FROM Products p
JOIN returns r
ON r.ProductKey = p.ProductKey
GROUP BY 1
HAVING SUM(r.ReturnQuantity) > 
(
	SELECT 
		AVG(total_return_quantity)
    FROM (
		SELECT
			SUM(ReturnQuantity) AS total_return_quantity
		FROM returns
        GROUP BY ProductKey
    ) sub
);

SELECT
	p.ProductName, 
	SUM(r.ReturnQuantity) AS total_return_quantity
FROM Products p
JOIN returns r
ON r.ProductKey = p.ProductKey
GROUP BY 1;

SELECT 
		AVG(total_return_quantity)
    FROM (
		SELECT
			SUM(ReturnQuantity) AS total_return_quantity
		FROM returns
        GROUP BY ProductKey
    ) sub;
    
-- Find the regions with their return quantity using subquery in Join Clause
SELECT
	t.Region,
    sub.total_return_quantity
FROM territories t
JOIN (
	SELECT
		r.TerritoryKey,
        SUM(r.ReturnQuantity) AS total_return_quantity
	FROM returns r
    GROUP BY r.TerritoryKey -- 1 as an index
) sub
ON t.SalesTerritoryKey = sub.TerritoryKey
ORDER BY sub.total_return_quantity DESC;

WITH TotalReturnQtyTable AS (
	SELECT
		r.TerritoryKey,
        SUM(r.ReturnQuantity) AS total_return_quantity
	FROM returns r
    GROUP BY r.TerritoryKey
)
SELECT
	Region,
    total_return_quantity
FROM territories t
JOIN TotalReturnQtyTable r
ON t.SalesTerritoryKey = r.TerritoryKey
ORDER BY total_return_quantity DESC;

SELECT COUNT(*) FROM returns;

-- CORRELATED SUBQUERIES.....
USE bike_analysis;

SELECT 
	p.ProductKey,
    p.ProductName,
    r.returnQuantity
FROM Products p 
JOIN returns r
ON p.ProductKey = r.ProductKey
WHERE r.returnQuantity > (
	SELECT 
		AVG(r2.returnQuantity)
	FROM returns r2
    JOIN Products p2 
    ON r2.ProductKey = p2.ProductKey
    WHERE p2.ProductSubcategoryKey = p.ProductSubcategoryKey
)
ORDER BY r.returnQuantity DESC;

SELECT 
	ProductSubcategoryKey,
	AVG(returnQuantity) 
FROM Returns r
JOIN Products p
ON p.ProductKey = r.ProductKey
GROUP BY 1;

SELECT 
	p.ProductKey,
	returnQuantity
FROM Returns r
JOIN Products p
ON p.ProductKey = r.ProductKey;

SELECT 1>1;

-- Return the region with maximum return value
SELECT
	t.Region,
    sub.total_return_quantity
FROM territories t
JOIN (
	SELECT
		r.TerritoryKey,
		SUM(r.ReturnQuantity) AS total_return_quantity
	FROM returns r
    GROUP BY r.TerritoryKey
) sub
ON t.SalesTerritoryKey = sub.TerritoryKey
WHERE sub.total_return_quantity = 
(
	SELECT 
		MAX(total_return_quantity)
	FROM (
		SELECT
			SUM(r2.ReturnQuantity) AS total_return_quantity
		FROM returns r2
		GROUP BY r2.TerritoryKey
	) sub2
);

-- DATE MANIPULATION
DESC returns;
DESC `sales-2015`;

-- CURRENT_DATE()
SELECT Current_DATE();
SELECT * FROM `sales-2015`;

-- Let's create table name events
-- TIMESTAMP - [YYYY-MM-DD HH:MM:SS]
CREATE TABLE Events(
	event_id INT AUTO_INCREMENT,
    event_name VARCHAR(100),
    event_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	delivery_date DATE,
    PRIMARY KEY(event_id)
);
DESC Events;

INSERT INTO Events(event_name,event_date,delivery_date)
VALUES("audit", '2025-06-26 15:00:00', '2025-06-26');

INSERT INTO events (event_name, event_date, delivery_date)
VALUES 
('Product Launch', '2025-07-15', '2025-07-10'),
('Annual Meetup', '2025-08-01', '2025-07-25'),
('Marketing Campaign', '2025-07-05', '2025-07-01'),
('Customer Webinar', '2025-06-30', '2025-06-25'),
('Software Deployment', '2025-07-20', '2025-07-18');

SELECT * FROM Events;



INSERT INTO Events(event_name,event_date,delivery_date)
VALUES("Project X", CURRENT_TIMESTAMP() , CURRENT_DATE());

SELECT CURRENT_TIME();

DESC Events;
-- Add Event With Current Time
-- Add column Event_time

ALTER TABLE Events
ADD Column event_time TIME;
DESC Events;
SELECT * FROM Events;

INSERT INTO Events(event_name, delivery_date, event_time)
VALUES('Team Sync',CURRENT_DATE(), CURRENT_TIME());

-- CURRENT_TIMESTAMP() OR NOW() 

SELECT CURRENT_TIMESTAMP();
SELECT NOW();

SELECT YEAR('2025-06-21');
SELECT YEAR(CURRENT_DATE());
SELECT MONTH(CURRENT_DATE());
SELECT DAY(CURRENT_DATE());

-- Using EXTRACT to extract month/year/day from a date.
SELECT EXTRACT(YEAR FROM CURRENT_DATE()) AS Current_year;
DESC Events;
SELECT 
	event_name,
    event_date,
	EXTRACT(MONTH FROM event_date) AS event_month
FROM Events;

-- DATE_FORMAT -> '26th of June-2025'
SELECT 
	event_name,
    event_date,
    DATE_FORMAT(event_date, '%D of %M-%Y ') AS Formatted_date, 
	EXTRACT(MONTH FROM event_date) AS event_month
FROM Events;

-- Date Manipulation
USE bike_analysis;
DESC Events;
SELECT * FROM Events;

-- DATE GROUPING
SELECT
	MONTH(event_date) AS month,
    COUNT(*) AS event_count
FROM Events
GROUP BY 1;

-- DATE Arithmetic 
SELECT DATE_ADD('2024-05-11', INTERVAL 10 DAY) AS DateAdd;
SELECT DATE_ADD('2024-05-11', INTERVAL -10 DAY) AS DateAdd;
SELECT DATE_SUB('2024-05-11', INTERVAL 1 MONTH) AS DateSub;
SELECT DATE_SUB('2024-05-11', INTERVAL -1 MONTH) AS DateSub;

-- Chaining of Intervals

SELECT 
	DATE_ADD(
		DATE_ADD('2024-05-11', INTERVAL 1 MONTH),
        INTERVAL 10 DAY
	) AS ChainingOfDate;
    
SELECT DATE_ADD('2025-06-28 19:25:57', INTERVAL 1 YEAR);

SELECT * FROM Events;
-- Update all the delivery date by +3 days from the event date ....
DESC Events;
SET SQL_SAFE_UPDATES = 0;
UPDATE Events
SET delivery_date = DATE_ADD(event_date, INTERVAL 3 DAY);
SELECT * FROM Events;

SELECT DATE_ADD('2025-06-28 19:25:57', INTERVAL 23 hour);
SELECT DATE_ADD('2025-06-28 ', INTERVAL 25 hour);

-- DATEDIFF
SELECT
	event_id,
    event_name,
    event_date,
    delivery_date,
    DATEDIFF(delivery_date,event_date) AS delivery_days_diff
FROM Events;

SELECT
	*,
    DATEDIFF(delivery_date,event_date) AS delivery_days_diff
FROM Events;

SELECT
	*,
    ABS(DATEDIFF(event_date,delivery_date)) AS delivery_days_diff
FROM Events;

SELECT * FROM returns; -- "mm/dd/yyyy" --> "YYYY-MM-DD"

-- STR_TO_DATE 
DESC Events;
SELECT STR_TO_DATE('30th May 2026', '%D %M %Y');

-- DATE CLEANING/ DATE PREPROCESSING IN Original Tables
DESC Calendar;
SELECT * FROM Calendar;
-- Pattern DD-MM-YYYY
-- First Rename the column to Calendar_date
ALTER TABLE Calendar
RENAME COLUMN date TO calendar_date;

UPDATE Calendar
SET calendar_date = STR_TO_DATE(calendar_date, "%d-%m-%Y");

ALTER TABLE Calendar
MODIFY COLUMN calendar_date DATE;

SELECT COUNT(*) FROM Calendar;

-- DATE CLEANING ON Customers Table
DESC Customers;
SELECT DISTINCT DateOfBirth FROM Customers;
-- Pattern dd/mm/yyyy
UPDATE Customers
SET DateOfBirth = STR_TO_DATE(DateOfBirth, "%d/%m/%Y");

SELECT COUNT(*) FROM Customers;

ALTER TABLE Customers
MODIFY COLUMN DateOfBirth DATE;

-- RETURNS DATA Cleaning 
DESC Returns;
SELECT * FROM Returns;

-- Pattern mm/dd/yyyy -- month/date is in single digit

UPDATE Returns
SET ReturnDate = STR_TO_DATE(ReturnDate, "%c/%e/%Y");

SELECT COUNT(*) FROM Returns;

ALTER TABLE Returns
MODIFY COLUMN ReturnDate DATE;

-- DATE Cleaning Or Date preprocessing on `sales-2015`;
DESC `sales-2015`;
SELECT Count(*) FROM `sales-2015`;
SELECT * FROM `sales-2015`;

UPDATE `sales-2015`
SET OrderDate = 
	CASE
		WHEN OrderDate LIKE '__-__-____' THEN STR_TO_DATE(OrderDate, "%m-%d-%Y")
        ELSE STR_TO_DATE(OrderDate, "%c/%d/%Y")
    END;
    
UPDATE `sales-2015`
SET StockDate = STR_TO_DATE(StockDate, "%m-%d-%Y")
WHERE StockDate LIKE '__-__-____';

UPDATE `sales-2015`
SET StockDate = STR_TO_DATE(StockDate, "%c/%d/%Y")
WHERE StockDate LIKE '%/%/%';

DESC `sales-2015`;
ALTER TABLE `sales-2015`
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDATE DATE;

-- DATE Cleaning Or Date preprocessing on `sales-2016`;
DESC `sales-2016`;
SELECT * FROM `sales-2016`;
SELECT COUNT(*) FROM `sales-2016`;

UPDATE `sales-2016`
SET OrderDate = STR_TO_DATE(OrderDate, "%c/%e/%Y")
WHERE OrderDate LIKE '%/%/%';

UPDATE `sales-2016`
SET StockDate = STR_TO_DATE(StockDate, "%c/%e/%Y")
WHERE StockDate LIKE '%/%/%';

ALTER TABLE `sales-2016`
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDATE DATE;

-- DATE Cleaning Or Date preprocessing on `sales-2017`;
DESC `sales-2017`;
SELECT * FROM `sales-2017`;
SELECT COUNT(*) FROM `sales-2017`;

UPDATE `sales-2017`
SET OrderDate = STR_TO_DATE(OrderDate, "%c/%e/%Y")
WHERE OrderDate LIKE '%/%/%';

UPDATE `sales-2017`
SET StockDate = STR_TO_DATE(StockDate, "%c/%e/%Y")
WHERE StockDate LIKE '%/%/%';

ALTER TABLE `sales-2017`
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDATE DATE;

-- WINDOW Functions 
USE bike_analysis;
ALTER TABLE `session 13 dataset (1)`
RENAME To sales;
DESC sales;
SELECT * FROM sales;

-- Find the cumulative total sum by Salesperson 
SELECT 
	*,
    SUM(SaleAmount) OVER(
		PARTITION BY Salesperson
        ORDER BY SaleDate
    ) AS CumulativeSalesPerPerson
FROM sales;

SELECT 
	Salesperson,
    SUM(SaleAmount) AS TotalSales 
FROM sales
GROUP BY Salesperson;

-- Rank the Sales By Sales Amount
SELECT 
	*,
    RANK() OVER(
	ORDER BY SaleAmount DESC
) AS SalesRank
FROM sales;

SELECT 
	*,
    DENSE_RANK() OVER(
	ORDER BY SaleAmount DESC
) AS SalesRank
FROM sales;

-- Finding the 3 Days Moving Average
SELECT 
	*,
    AVG(SaleAmount) OVER(
	ORDER BY SaleDate
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) AS MovingAverage
FROM sales;

-- Finding the 5 Days Moving Average
SELECT 
	*,
    AVG(SaleAmount) OVER(
	ORDER BY SaleDate
    ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
) AS MovingAverage
FROM sales;

-- Income Difference From Average
DESC Customers;

SELECT
	CustomerKey,
    FullName,
    AnnualIncome,
    AnnualIncome - AVG(AnnualIncome) OVER() AS income_difference_from_avg
FROM Customers;

SELECT AVG(AnnualIncome) FROM Customers;

-- Find the max annualIncome based on Prefix

SELECT DISTINCT Prefix FROM customers;

SELECT
	CustomerKey,
    Prefix,
    FullName,
    AnnualIncome,
    MAX(AnnualIncome) OVER(Partition BY Prefix) AS max_income_by_prefix
FROM Customers
WHERE Prefix IS NOT NULL AND AnnualIncome IS NOT NULL;


-- Find the max annualIncome based on Gender

SELECT DISTINCT Gender FROM customers;

SELECT
	CustomerKey,
    FullName,
    Gender,
    AnnualIncome,
    MAX(AnnualIncome) OVER(Partition BY Gender) AS max_income_by_prefix
FROM Customers;
	
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














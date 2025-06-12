/* DESC Calendar;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| Year  | int  | YES  |     | NULL    |       |
| Date  | text | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
*/

/*
mysql> DESC Customers;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| CustomerKey    | int          | YES  |     | NULL    |       |
| Prefix         | text         | YES  |     | NULL    |       |
| FirstName      | varchar(50)  | YES  |     | NULL    |       |
| LastName       | varchar(50)  | YES  |     | NULL    |       |
| FullName       | varchar(100) | YES  |     | NULL    |       |
| DateOfBirth    | text         | YES  |     | NULL    |       |
| Country        | varchar(50)  | YES  |     | NULL    |       |
| MaritalStatus  | text         | YES  |     | NULL    |       |
| Gender         | text         | YES  |     | NULL    |       |
| EmailAddress   | varchar(100) | YES  |     | NULL    |       |
| AnnualIncome   | int          | YES  |     | NULL    |       |
| TotalChildren  | int          | YES  |     | NULL    |       |
| EducationLevel | text         | YES  |     | NULL    |       |
| Occupation     | text         | YES  |     | NULL    |       |
| HomeOwner      | text         | YES  |     | NULL    |       |
| Phone_number   | text         | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
*/

/*
mysql> DESC territories;
+-------------------+------+------+-----+---------+-------+
| Field             | Type | Null | Key | Default | Extra |
+-------------------+------+------+-----+---------+-------+
| SalesTerritoryKey | int  | YES  |     | NULL    |       |
| Region            | text | YES  |     | NULL    |       |
| Country           | text | YES  |     | NULL    |       |
| Continent         | text | YES  |     | NULL    |       |
+-------------------+------+------+-----+---------+-------+
*/

/* DESC products;
+-----------------------+--------+------+-----+---------+-------+
| Field                 | Type   | Null | Key | Default | Extra |
+-----------------------+--------+------+-----+---------+-------+
| ProductKey            | int    | YES  |     | NULL    |       |
| ProductSubcategoryKey | int    | YES  |     | NULL    |       |
| ProductSKU            | text   | YES  |     | NULL    |       |
| ProductName           | text   | YES  |     | NULL    |       |
| ModelName             | text   | YES  |     | NULL    |       |
| ProductDescription    | text   | YES  |     | NULL    |       |
| ProductColor          | text   | YES  |     | NULL    |       |
| ProductSize           | text   | YES  |     | NULL    |       |
| ProductStyle          | text   | YES  |     | NULL    |       |
| ProductCost           | double | YES  |     | NULL    |       |
| ProductPrice          | double | YES  |     | NULL    |       |
+-----------------------+--------+------+-----+---------+-------+
*/

/* DESC `product-subcategories`;
+-----------------------+------+------+-----+---------+-------+
| Field                 | Type | Null | Key | Default | Extra |
+-----------------------+------+------+-----+---------+-------+
| ProductSubcategoryKey | int  | YES  |     | NULL    |       |
| SubcategoryName       | text | YES  |     | NULL    |       |
| ProductCategoryKey    | int  | YES  |     | NULL    |       |
+-----------------------+------+------+-----+---------+-------+
*/
/*
DESC `product-categories`;
+--------------------+------+------+-----+---------+-------+
| Field              | Type | Null | Key | Default | Extra |
+--------------------+------+------+-----+---------+-------+
| ProductCategoryKey | int  | YES  |     | NULL    |       |
| CategoryName       | text | YES  |     | NULL    |       |
+--------------------+------+------+-----+---------+-------+
*/
/*
mysql> DESC returns;
+----------------+------+------+-----+---------+-------+
| Field          | Type | Null | Key | Default | Extra |
+----------------+------+------+-----+---------+-------+
| ReturnDate     | text | YES  |     | NULL    |       |
| TerritoryKey   | int  | YES  |     | NULL    |       |
| ProductKey     | int  | YES  |     | NULL    |       |
| ReturnQuantity | int  | YES  |     | NULL    |       |
+----------------+------+------+-----+---------+-------+
*/
/*
 DESC `sales-2015`;
+---------------+------+------+-----+---------+-------+
| Field         | Type | Null | Key | Default | Extra |
+---------------+------+------+-----+---------+-------+
| OrderDate     | text | YES  |     | NULL    |       |
| StockDate     | text | YES  |     | NULL    |       |
| OrderNumber   | text | YES  |     | NULL    |       |
| ProductKey    | int  | YES  |     | NULL    |       |
| CustomerKey   | int  | YES  |     | NULL    |       |
| TerritoryKey  | int  | YES  |     | NULL    |       |
| OrderLineItem | int  | YES  |     | NULL    |       |
| OrderQuantity | int  | YES  |     | NULL    |       |
+---------------+------+------+-----+---------+-------+
*/

### Create schema/database and check
SHOW DATABASES;
CREATE SCHEMA techtrendpro;
### Activate the schema created for use
USE techtrendpro;

### Import data tables using the 'Table Data Import Wizard'
### check tables imported
SHOW TABLES;

-- EXPLORATORY DATA ANALYSIS --

### Check number of rows in imported tables
SELECT COUNT(*) AS Feedback_Rows FROM feedback_data;
SELECT COUNT(*) AS Sales_Rows FROM sales_data;
SELECT COUNT(*) AS Product_Rows FROM product_data;

### Print 1st five rows of imported tables
SELECT * FROM feedback_data LIMIT 5;
SELECT * FROM sales_data LIMIT 5;
SELECT * FROM product_data LIMIT 5;

### Check the data shape to understand data type & description
SHOW COLUMNS FROM feedback_data;
DESCRIBE product_data;
DESC sales_data;

### Check for missing values
SELECT * FROM feedback_data
WHERE `Feedback ID` IS NULL
OR `Product ID` IS NULL
OR `Return Date` IS NULL
OR `Return Reason` IS NULL
OR `Customer Feedback` IS NULL;

SELECT * FROM sales_data
WHERE `Sale ID` IS NULL
OR `Product ID` IS NULL
OR `Sales Date` IS NULL
OR `Sales Volume` IS NULL
OR `Revenue Generated` IS NULL;


#### Using the count function to check null values
SELECT 
COUNT(*) AS num_rows,
SUM(`Product ID` IS NULL) AS ID_null,
SUM(`Product Category` IS NULL) AS Category_null,
SUM(`Product Attributes` IS NULL) AS ID_null 
FROM product_data;

-- DATA CLEANING AND PREPROCESSING

### Change `Return Date` data type in feedback_data table
ALTER TABLE feedback_data MODIFY COLUMN `Return Date` date;

### Change `Sales Date` data type in sales_data table
ALTER TABLE sales_data MODIFY COLUMN `Sales Date` date;

### Checking dataset for dupicates in feedback table
SELECT `Feedback ID`, COUNT(*) AS Count_Duplicates
FROM feedback_data
GROUP BY `Feedback ID`
HAVING COUNT(*) > 1;

### Checking dataset for dupicates in product table
SELECT `Product ID`, COUNT(*) AS Count_Duplicates
FROM product_data
GROUP BY `Product ID`
HAVING COUNT(*) > 1;

### Checking dataset for dupicates sales table
SELECT `Sale ID`, COUNT(*) AS Count_Duplicates
FROM sales_data
GROUP BY `Sale ID`
HAVING COUNT(*) > 1;

### Crosscheck changes made to data
SHOW COLUMNS FROM feedback_data;
DESCRIBE product_data;
DESC sales_data;

SELECT * FROM feedback_data LIMIT 5;
SELECT * FROM sales_data LIMIT 5;
SELECT * FROM product_data LIMIT 5;


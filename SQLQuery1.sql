-- RETAIL SALES ANALYSIS
Create DATABASE SQL_PROJECT1

-- CREATING TABLE 

CREATE TABLE RETAIL_SALES
	(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(50),
		age INT,
		category VARCHAR(50),
		quantiy INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT

	)

ALTER TABLE dbo.RETAIL_SALES
ALTER COLUMN sale_time VARCHAR(20);

BULK INSERT dbo.RETAIL_SALES
FROM 'E:\Projects\SQL\SQL - Retail Sales Analysis_utf .csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = 'UTF8'
);

SELECT * FROM RETAIL_SALES

SELECT COUNT(*)
FROM RETAIL_SALES 


SELECT * 
FROM RETAIL_SALES
WHERE 
	transactions_id IS NULL 
	OR 
	sale_date IS NULL 
	OR 
	sale_time IS NULL 
	OR 
	customer_id IS NULL 
	OR 
	gender IS NULL 
	OR 
	AGE IS NULL
	OR 
	category IS NULL 
	OR 
	quantiy IS NULL 
	OR
	price_per_unit IS NULL 
	OR 
	cogs IS NULL 
	OR 
	total_sale IS NULL

DELETE FROM RETAIL_SALES
WHERE 
	transactions_id IS NULL 
	OR 
	sale_date IS NULL 
	OR 
	sale_time IS NULL 
	OR 
	customer_id IS NULL 
	OR 
	gender IS NULL 
	OR 
	category IS NULL 
	OR 
	quantiy IS NULL 
	OR
	price_per_unit IS NULL 
	OR 
	cogs IS NULL 
	OR 
	total_sale IS NULL
	


	SELECT * FROM RETAIL_SALES
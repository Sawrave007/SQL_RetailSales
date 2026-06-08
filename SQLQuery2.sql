-- DATA EXPLORATION 


SELECT COUNT(DISTINCT customer_id) as total_customers 
FROM RETAIL_SALES 
--155



SELECT DISTINCT category as total_customers 
FROM RETAIL_SALES 
--Beauty, Electronics ,Clothing

SELECT 
category,
sum(total_sale) Total_sale, 
count(*) total_orders
from RETAIL_SALES
group by category


SELECT 
category, 
sum(total_sale) Total_sale,
sum(quantiy) Total_quantity
from RETAIL_SALES
where category = 'Clothing'
group by category

SELECT
category,
gender,
COUNT(*) AS TOTAL_TRANSACTIONS
FROM RETAIL_SALES
GROUP BY category, gender

-- CALCULATE AVERAGE SALE FROM EACH MONTH AND FIND THE BEST MONTH OF THE YEAR 

SELECT top 2
	YEAR(sale_date) years,
	DATENAME(Month, sale_date) as months,
	avg(total_sale) total_sales
FROM RETAIL_SALES
GROUP BY DATENAME(Month, sale_date), YEAR(sale_date), MONTH(sale_date)
order by  avg(total_sale) DESC

-- top 5 customers by total sales

SELECT TOP 5
	customer_id,
	SUM(total_sale) TOTAL_SALES
FROM RETAIL_SALES
GROUP BY customer_id
ORDER BY TOTAL_SALES DESC




--Which category generates the highest total revenue?

SELECT TOP 1
	category,
	SUM(total_sale) TOTAL_REVENUE
FROM RETAIL_SALES
GROUP BY category
ORDER BY TOTAL_REVENUE DESC



-- Rank customers by total spend within each category
SELECT 
    customer_id,
    category,
    SUM(total_sale) AS total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(total_sale) DESC) AS rank
FROM RETAIL_SALES
GROUP BY customer_id, category



-- 

WITH ranked_customers AS (
    SELECT 
        customer_id,
        category,
        SUM(total_sale) AS total_spend,
        RANK() OVER (PARTITION BY category ORDER BY SUM(total_sale) DESC) AS rank
    FROM dbo.RETAIL_SALES
    GROUP BY customer_id, category
)
SELECT 
    customer_id,
    category,
    total_spend,
    rank
FROM ranked_customers
WHERE rank <= 3
ORDER BY category, rank;

------- SHIFTING

SELECT 
    CASE 
        WHEN CAST(sale_time AS TIME) < '12:00:00' THEN 'Morning'
        WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_transactions
FROM RETAIL_SALES
GROUP BY 
    CASE 
        WHEN CAST(sale_time AS TIME) < '12:00:00' THEN 'Morning'
        WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY total_transactions DESC
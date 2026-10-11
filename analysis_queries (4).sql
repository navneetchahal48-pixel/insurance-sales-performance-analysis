-- Insurance Sales Performance Analysis (practice project)
-- Import insurance_sales_sample.csv into a table named insurance_sales.

-- 1. View the data
SELECT * FROM insurance_sales;

-- 2. Total policies sold
SELECT SUM(policy_sold) AS total_policies_sold
FROM insurance_sales;

-- 3. Total premium collected
SELECT SUM(premium_collected) AS total_premium_collected
FROM insurance_sales;

-- 4. Sales by region
SELECT region,
       SUM(policy_sold) AS policies_sold,
       SUM(premium_collected) AS premium_collected
FROM insurance_sales
GROUP BY region
ORDER BY premium_collected DESC;

-- 5. Sales by product
SELECT product_type,
       COUNT(*) AS records,
       SUM(policy_sold) AS policies_sold,
       SUM(premium_collected) AS premium_collected
FROM insurance_sales
GROUP BY product_type
ORDER BY premium_collected DESC;

-- 6. Monthly performance
SELECT SUBSTRING(sale_date, 1, 7) AS sale_month,
       SUM(policy_sold) AS policies_sold,
       SUM(premium_collected) AS premium_collected
FROM insurance_sales
GROUP BY SUBSTRING(sale_date, 1, 7)
ORDER BY sale_month;

-- 7. Compare sales channels
SELECT sales_channel,
       SUM(policy_sold) AS policies_sold,
       SUM(premium_collected) AS premium_collected
FROM insurance_sales
GROUP BY sales_channel
ORDER BY premium_collected DESC;

-- 8. Find records where no policy was sold
SELECT *
FROM insurance_sales
WHERE policy_sold = 0;

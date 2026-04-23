-- 1. Create database
CREATE DATABASE ecom_sales_db;
USE ecom_sales_db;

-- 2. Create table (copy-paste this)
CREATE TABLE sales (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(30),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(300),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- 1. Total Revenue & Profit
-- 1. Check if table has data
SELECT COUNT(*) AS total_rows FROM sales;

-- 2. Check actual column names (must match exactly)
SHOW COLUMNS FROM sales;

-- 3. See first 5 rows
SELECT * FROM sales LIMIT 5;

-- 2. Top Category by Profit
SELECT category, ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- 3. Monthly Sales Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 4. Top 5 Cities
SELECT city, ROUND(SUM(sales), 2) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;

-- 5. Average Order Value
SELECT ROUND(AVG(sales), 2) AS avg_order_value
FROM sales;

-- Run similar queries for other questions!
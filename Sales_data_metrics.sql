SELECT * FROM sales_metrics.sales_data;

-- Modify order_date column
SELECT order_date,
STR_TO_DATE(order_date, '%m/%d/%Y')
FROM sales_data;

UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%m/%d/%Y');

ALTER TABLE sales_data
MODIFY COLUMN order_date DATE;

-- Top performing products
SELECT product, SUM(sales) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC;

-- Regional Performance
SELECT city, SUM(sales) AS total_sales
FROM sales_data
GROUP BY city
ORDER BY total_sales DESC;

-- Hourly sales trends
SELECT `hour`, SUM(sales) AS total_sales
FROM sales_data
GROUP BY `hour`
ORDER BY `hour`;

-- Monthly sales trends
SELECT order_date, SUM(sales) AS total_sales
FROM sales_data
GROUP BY order_date
ORDER BY total_sales DESC;


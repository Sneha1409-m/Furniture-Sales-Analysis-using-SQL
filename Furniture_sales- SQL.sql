create database Furniture_sales;
CREATE TABLE furniture_sales (
  productTitle VARCHAR(500),
  originalPrice DECIMAL(10,2),
  price DECIMAL(10,2),
  sold INT,
  tagText VARCHAR(100)
);


desc furniture_sales;
select * from cleaned_furniture_sales;

 -- 1. Top 10 Best-Selling Products
 SELECT productTitle, sold
FROM cleaned_furniture_sales
ORDER BY sold DESC
LIMIT 10;

-- 2. Products with Highest Discount (originalPrice - price)
SELECT productTitle, originalPrice, price, (originalPrice - price) AS discount
FROM cleaned_furniture_sales
WHERE originalPrice IS NOT NULL
ORDER BY discount DESC
LIMIT 10;

--  3. Total Revenue Generated
SELECT ROUND(SUM(price * sold), 2) AS total_revenue
FROM cleaned_furniture_sales;

-- 4. Top-Selling Products with Free Shipping
SELECT productTitle, sold, price
FROM cleaned_furniture_sales
WHERE tagText = 'Free shipping'
ORDER BY sold DESC
LIMIT 10;


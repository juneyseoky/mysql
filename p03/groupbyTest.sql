create database groupbyTest;
use groupbyTest;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    sales INT
);
INSERT INTO products (product_name, category, price, sales) VALUES
('Apple', 'Fruit', 1.20, 100),
('Orange', 'Fruit', 1.00, 150),
('Banana', 'Fruit', 0.80, 120),
('Carrot', 'Vegetable', 0.50, 200),
('Broccoli', 'Vegetable', 1.30, 180),
('Potato', 'Vegetable', 0.70, 220),
('Chicken', 'Meat', 5.00, 80),
('Beef', 'Meat', 10.00, 60);

select * from products;

SELECT category, SUM(sales) AS total_sales
FROM products
GROUP BY category;

select category, AVG(price) '평균'
from products 
group by category;

drop table products;

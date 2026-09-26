CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, city, state)
VALUES
(1, 'Arun Kumar', 'Chennai', 'Tamil Nadu'),
(2, 'Priya Sharma', 'Coimbatore', 'Tamil Nadu'),
(3, 'Rahul Raj', 'Bangalore', 'Karnataka'),
(4, 'Sneha Devi', 'Madurai', 'Tamil Nadu'),
(5, 'Karthik M', 'Salem', 'Tamil Nadu'),
(6, 'Divya S', 'Erode', 'Tamil Nadu'),
(7, 'Vignesh R', 'Trichy', 'Tamil Nadu'),
(8, 'Naveen Kumar', 'Bangalore', 'Karnataka'),
(9, 'Harini P', 'Chennai', 'Tamil Nadu'),
(10, 'Sanjay Kumar', 'Coimbatore', 'Tamil Nadu');

INSERT INTO products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Headphones', 'Electronics', 2000),
(104, 'Keyboard', 'Accessories', 1200),
(105, 'Mouse', 'Accessories', 800),
(106, 'Backpack', 'Bags', 1500),
(107, 'Shoes', 'Fashion', 3000),
(108, 'T-Shirt', 'Fashion', 900),
(109, 'Watch', 'Accessories', 2500),
(110, 'Power Bank', 'Electronics', 1800);


INSERT INTO orders (order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-01-05', 'Delivered'),
(1002, 2, '2026-01-08', 'Delivered'),
(1003, 3, '2026-01-12', 'Shipped'),
(1004, 4, '2026-01-15', 'Delivered'),
(1005, 5, '2026-01-18', 'Cancelled'),
(1006, 6, '2026-01-20', 'Delivered'),
(1007, 7, '2026-01-23', 'Shipped'),
(1008, 8, '2026-01-25', 'Delivered'),
(1009, 9, '2026-01-28', 'Processing'),
(1010, 10, '2026-01-30', 'Delivered');

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1002, 105, 2),
(5, 1003, 104, 1),
(6, 1003, 109, 1),
(7, 1004, 106, 2),
(8, 1005, 108, 3),
(9, 1006, 107, 1),
(10, 1006, 110, 2),
(11, 1007, 103, 1),
(12, 1008, 101, 1),
(13, 1008, 105, 1),
(14, 1009, 109, 2),
(15, 1010, 102, 1);

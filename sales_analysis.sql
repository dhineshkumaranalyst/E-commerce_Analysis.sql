USE ecommerce_analysis;

-- E-COMMERCE SALES ANALYSIS --


-- 1. Product-wise Quantity Sold
SELECT
    products.product_name,
    SUM(order_details.quantity) AS total_quantity_sold
FROM order_details
INNER JOIN products
    ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_quantity_sold DESC;


-- 2. Product-wise Revenue
SELECT
    products.product_name,
    SUM(order_details.quantity * products.price) AS total_revenue
FROM order_details
INNER JOIN products
    ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;


-- 3. Category-wise Revenue
SELECT
    products.category,
    SUM(order_details.quantity * products.price) AS total_revenue
FROM order_details
INNER JOIN products
    ON order_details.product_id = products.product_id
GROUP BY products.category
ORDER BY total_revenue DESC;


-- 4. Customer-wise Spending
SELECT
    customers.customer_name,
    SUM(order_details.quantity * products.price) AS total_spent
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
INNER JOIN order_details
    ON orders.order_id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.product_id
GROUP BY customers.customer_name
ORDER BY total_spent DESC;


-- 5. Order Status Analysis
SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 6. Status-wise Revenue
SELECT
    orders.order_status,
    SUM(order_details.quantity * products.price) AS total_revenue
FROM orders
INNER JOIN order_details
    ON orders.order_id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.product_id
GROUP BY orders.order_status
ORDER BY total_revenue DESC;


-- 7. January 2026 Revenue
SELECT
    SUM(order_details.quantity * products.price) AS monthly_revenue
FROM orders
INNER JOIN order_details
    ON orders.order_id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.product_id
WHERE MONTH(orders.order_date) = 1
  AND YEAR(orders.order_date) = 2026;


-- 8. Cancelled Order Value
SELECT
    SUM(order_details.quantity * products.price) AS cancelled_amount
FROM orders
INNER JOIN order_details
    ON orders.order_id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.product_id
WHERE orders.order_status = 'Cancelled';


-- 9. Products Above Average Price
SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


-- 10. Electronics Products Using CTE
WITH electronics AS (
    SELECT *
    FROM products
    WHERE category = 'Electronics'
)
SELECT *
FROM electronics;


-- 11. Product Price Classification Using CASE WHEN
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 20000 THEN 'High'
        WHEN price >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS price_category
FROM products;
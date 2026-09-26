# 🛒 E-Commerce Sales Analysis Using SQL

## 📌 Project Overview

This project analyzes an e-commerce sales dataset using SQL to identify
sales trends, customer spending patterns, product performance, and order
status information.

The project demonstrates practical SQL skills used in Data Analytics.

---

## 🎯 Project Objectives

- Analyze product-wise sales
- Calculate product and category revenue
- Identify high-spending customers
- Analyze order statuses
- Calculate monthly sales value
- Analyze cancelled orders
- Use SQL concepts for business analysis

---

## 🗂️ Database Structure

The project contains four tables:

- `customers` – Customer information
- `products` – Product details and prices
- `orders` – Order information and status
- `order_details` – Products and quantities in each order

### 🔗 Table Relationships

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ▼
Order_Details
    │
    │ product_id
    ▼
Products




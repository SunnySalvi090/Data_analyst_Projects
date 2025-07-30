# eCommerce_InsightX
📦 Ecommerce Data Analysis Project
This project is a SQL-based data analysis of an eCommerce dataset. It demonstrates key data analytics skills using complex SQL queries to extract valuable business insights such as top-paying customers, revenue patterns, and customer behavior over time.

📊 Project Overview
The goal of this project is to simulate the role of a Data Analyst working with raw eCommerce data. It showcases:

Data cleaning and joining across multiple tables (e.g., orders, payments)

Aggregation and ranking of customer payments

Year-wise analysis of top spenders

Use of analytical SQL functions like DENSE_RANK(), GROUP BY, and JOIN

🔍 Key SQL Logic Example
sql
Copy
Edit
SELECT years, customer_id, payment, d_rank 
FROM (
    SELECT 
        YEAR(orders.order_purchase_timestamp) AS years,
        orders.customer_id,
        SUM(payments.payment_value) AS payment,
        DENSE_RANK() OVER (
            PARTITION BY YEAR(orders.order_purchase_timestamp) 
            ORDER BY SUM(payments.payment_value) DESC
        ) AS d_rank
    FROM orders 
    JOIN payments ON payments.order_id = orders.order_id
    GROUP BY orders.order_purchase_timestamp, orders.customer_id
) AS a
WHERE d_rank <= 3;
🧠 This query returns the top 3 spending customers per year, highlighting repeat high-value buyers.

📂 Files Included
Ecommerce Project DA.sql — All queries used for business insights.

(Optionally add your Jupyter Notebook or CSV files if available)

🛠️ Tools & Technologies
SQL (MySQL)

Jupyter Notebook

eCommerce Dataset (can be shared or linked if public)

✅ Skills Demonstrated
Data Cleaning

Data Aggregation

SQL Window Functions

Business Insight Generation

Structured Query Optimization

📌 How to Use
Clone this repository

Load the SQL file in a SQL-compatible Jupyter Notebook or MySQL environment

Connect to your database (with orders, payments tables, etc.)

Run and modify queries for further exploration

📧 Contact
If you have questions or feedback, feel free to reach out via LinkedIn or email me at: sunnysalvi090@gmail.com

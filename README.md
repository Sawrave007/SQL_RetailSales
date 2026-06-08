# SQL_RetailSales

# Retail Sales Analysis — SQL Project

## Overview
This project performs end-to-end retail sales analysis using SQL Server. Starting from raw transactional data, the project covers database setup, data cleaning, exploration, and business-focused analysis to answer key questions about sales performance, customer behavior, and product categories.

---

## Dataset
- **Source:** Retail Sales Dataset (CSV)
- **Records:** ~2,000 transactions
- **Key Fields:** `transaction_id`, `sale_date`, `sale_time`, `customer_id`, `gender`, `age`, `category`, `quantity`, `price_per_unit`, `cogs`, `total_sale`

---

## Tools Used
- **Database:** Microsoft SQL Server
- **Language:** SQL (T-SQL)
- **Skills:** DDL, DML, Aggregations, Joins, Window Functions, Date Functions

---

## Project Workflow

### 1. Database & Table Setup
- Created a dedicated database and retail sales table with appropriate data types
- Imported CSV data using `BULK INSERT`

### 2. Data Cleaning
- Identified NULL values across all columns
- Removed incomplete records to ensure data integrity

### 3. Data Exploration
- Total number of transactions and unique customers
- Distinct product categories available
- Sales and order volume by category

### 4. Business Questions Answered

**Q1 — Which category generates the highest total revenue?**
> Analyzed total sales and order count grouped by category to identify top performing product lines.

**Q2 — What are the best performing months by average sales each year?**
> Used date functions to extract year and month, then ranked months by average transaction value to identify seasonal trends.

**Q3 — Who are the top 5 customers by total spend?**
> Aggregated total sales per customer and ranked to identify the most valuable customers.

**Q4 — What is the transaction breakdown by category and gender?**
> Cross-analyzed category and gender to understand buying patterns across different customer segments.

**Q5 — Top 3 customers by spend within each category (Window Function)**
> Used `RANK() OVER (PARTITION BY category)` to identify the highest spending customers in each product category.

---

## Key Findings
- Electronics and Clothing are the highest revenue-generating categories
- A small group of repeat customers contribute disproportionately to total revenue
- Clear gender-based differences exist in purchasing patterns across categories

---

## How to Run
1. Open SQL Server Management Studio (SSMS)
2. Run `SQLQuery1.sql` to create the database, table, and import data
3. Run `SQLQuery2.sql` for data cleaning, exploration, and business analysis queries

---

## Author
**Sawrave Ahmed**
- GitHub: [github.com/Sawrave007](https://github.com/Sawrave007)
- LinkedIn: [linkedin.com/in/sawrave-ahmed007](https://linkedin.com/in/sawrave-ahmed007)

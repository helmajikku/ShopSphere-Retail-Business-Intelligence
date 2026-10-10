# ShopSphere | Retail Business Intelligence with MySQL

> **Turning retail data into business answers — one SQL query at a time.**

ShopSphere is a SQL portfolio project built around a small retail database. It demonstrates how relational data can be explored and connected to answer practical business questions about buyers, products, orders, categories, and payments.

Rather than presenting SQL as a collection of isolated commands, this project follows a business-analysis journey: from setting up a database to comparing sales values, finding customer patterns, classifying operational statuses, and creating reusable stored procedures.

## Project at a glance

| Item | Details |
|---|---|
| Project | ShopSphere — Retail Business Intelligence |
| Database | MySQL |
| Dataset | Sample retail data across six related tables |
| SQL scripts | 9 files |
| Practice questions | 50 numbered questions |
| Main focus | SQL querying, relational analysis, and business-oriented insights |

## Business scenario

Imagine a retail business that needs to understand its buyers, product catalogue, orders, and payment activity. ShopSphere uses a relational MySQL database to explore questions such as:

- Which cities do buyers come from, and how many buyers are in each city?
- Which products are priced above the overall average or the Electronics-category average?
- What is the calculated value of order items, and which products or categories contribute the most?
- Which buyers have ordered, and which have never placed an order?
- Which orders have failed payments?
- How can products, orders, and payments be grouped into useful business categories?
- How can frequently used analyses be packaged into reusable stored procedures?

These queries are intended as a learning and portfolio demonstration. Calculated order-item values are based on product price multiplied by quantity; they should not automatically be interpreted as confirmed paid revenue.

## Database design

The project uses six related tables:

| Table | Purpose | Key relationships |
|---|---|---|
| `buyer_profiles` | Buyer details, city, email, and signup date | Parent of `sales_orders` |
| `product_groups` | Product category names | Parent of `product_catalog` |
| `product_catalog` | Product names, category IDs, and prices | References `product_groups` |
| `sales_orders` | Buyer orders, dates, and order statuses | References `buyer_profiles` |
| `order_lines` | Products and quantities included in each order | References `sales_orders` and `product_catalog` |
| `payment_records` | Payment method, status, and paid amount | References `sales_orders` |

The relationships let the queries combine buyer, product, order, and payment information instead of analysing each table in isolation.

## SQL concepts demonstrated

### 1. Database setup and foundational queries
- Creating and selecting a database
- Creating tables and defining primary and foreign keys
- Inserting sample records
- Selecting columns and filtering rows with `WHERE`
- Removing duplicate values with `DISTINCT`
- Pattern matching with `LIKE`
- Sorting results with `ORDER BY`

### 2. Aggregate analysis
- `COUNT()`, `AVG()`, `MAX()`, and `MIN()`
- Rounding aggregate results with `ROUND()`
- Grouping records with `GROUP BY`
- Filtering grouped results with `HAVING`
- Counting buyers by city and orders by buyer
- Summing product quantities and calculating order-item values

### 3. Relational analysis with joins
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Connecting buyers to orders and products to order lines
- Identifying buyers with no orders using `LEFT JOIN` and `IS NULL`
- Combining left- and right-join results with `UNION` to demonstrate a full-outer-join-style result in MySQL

### 4. Subqueries, CTEs, and reusable query objects
- Scalar subqueries for average-price comparisons
- `IN` subqueries to identify buyers who have placed orders
- Common Table Expressions (`WITH`) for readable intermediate result sets
- Window functions with `RANK()` and `DENSE_RANK()`
- Creating and querying a view

### 5. Business-friendly classification
- `CASE` expressions to classify products by price
- Mapping order statuses to labels such as *Completed* and *In Transit*
- Mapping payment statuses to labels such as *Successful* and *Awaiting Payment*

### 6. Set, date, string, and NULL handling
- `UNION` versus `UNION ALL`
- `MONTHNAME()` and `YEAR()`
- `UPPER()` and `CONCAT()`
- Finding missing email values with `IS NULL`

### 7. Stored procedures
- Creating procedures with `IN` parameters
- Returning products above a specified price
- Returning products for a specified category
- Calling procedures with different input values

## Repository structure

The repository is organised into nine SQL scripts so a reviewer can follow the learning path in order.

```text
ShopSphere/
├── 01_Database_Setup.sql
├── 02_Basic_Queries.sql
├── 03_Aggregate_Functions.sql
├── 04_Group_By_Having.sql
├── 05_Joins_and_Sales_Analysis.sql
├── 06_Subqueries_CTEs_and_Advanced_Queries.sql
├── 07_CASE_and_Business_Insights.sql
├── 08_Union_Date_String_Null_Functions.sql
├── 09_Stored_Procedures.sql
└── README.md
```

## How to run the project

**Recommended environment:** MySQL Workbench or another MySQL client that supports the `DELIMITER` command.

1. Download or clone this repository.
2. Open `01_Database_Setup.sql` in your MySQL client and run it once to create the database, tables, and sample records.
3. Run `02_Basic_Queries.sql` through `08_Union_Date_String_Null_Functions.sql` in numerical order.
4. Run `09_Stored_Procedures.sql` to create and test the stored procedures.
5. Review each query's comments and result grid to understand the business question and the output.

### Important run notes
- Run the setup script against a clean project database. Re-running it may fail if its tables and sample records already exist.
- The view and stored procedures are created as database objects. If you run those creation statements again, MySQL may report that the objects already exist.
- The stored-procedure file uses `DELIMITER`, which is supported by MySQL Workbench and the MySQL command-line client, but not by every SQL editor.
- The project is written for **MySQL**; syntax and feature support can differ in other database systems.

## What this project demonstrates

ShopSphere brings together SQL skills that are useful in entry-level data analysis and reporting tasks:

- Translating a business question into a query
- Choosing the appropriate table relationships and join type
- Summarising data at buyer, product, order, and category levels
- Comparing individual values with aggregate benchmarks
- Handling missing values and status categories
- Ranking results and building reusable query components
- Organising SQL scripts with comments and a progressive structure

## Scope and limitations

- The database contains sample data for practice; it is not a live retail dataset.
- Results depend on the sample records included in the setup script.
- Order-item values are calculated from catalogue price and quantity. The current calculations do not, by themselves, confirm that an order was delivered or paid successfully.
- This project focuses on SQL analysis and database querying; it does not claim to be a production retail system or a complete financial reconciliation model.

## About the project

ShopSphere is part of my practical learning journey in data analytics. It reflects my practice in using SQL to structure data, investigate business questions, and present results in a way that can be understood by a business audience.

I am building on my professional experience in management, administration, coordination, and stakeholder communication while developing hands-on analytical skills.

---

**Project:** ShopSphere — Retail Business Intelligence  
**Technology:** MySQL  
**Portfolio focus:** SQL querying · Data analysis · Business insights

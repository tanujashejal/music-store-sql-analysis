# Music Store SQL Analysis

## Project Overview
This project analyzes a sample Music Store database using PostgreSQL. The goal is to understand customer spending, track sales, popular music genres, and artist sales.

## Technologies Used
- PostgreSQL
- SQL
- pgAdmin 4

## Database Tables
1. artists
2. albums
3. genres
4. tracks
5. customers
6. invoices
7. invoice_items

## SQL Concepts Used
- CREATE TABLE and INSERT INTO
- SELECT and WHERE
- ORDER BY
- JOIN
- GROUP BY and HAVING
- Aggregate Functions: COUNT, SUM, AVG, MIN, MAX
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK and ROW_NUMBER

## Business Questions
1. Which customers spend the most?
2. Which country generates the highest invoice revenue?
3. Which tracks sell the most units?
4. Which music genre is the most popular?
5. Which artists generate the highest track sales?
6. What is the average track price?
7. How many tracks are available in each album?

## Project Structure
- `create_tables.sql` - Creates all database tables.
- `insert_data.sql` - Inserts sample records.
- `business_analysis.sql` - Contains business analysis and SQL practice queries.
- `README.md` - Documents the project.

## How to Run
1. Install PostgreSQL and pgAdmin 4.
2. Create a database named `music_store`.
3. Open Query Tool for the `music_store` database.
4. Run `create_tables.sql` first.
5. Run `insert_data.sql` once.
6. Run individual queries from `business_analysis.sql`.

## Learning Outcomes
- Understanding relational database tables and foreign keys.
- Writing SQL queries using joins and aggregate functions.
- Analyzing sample sales and customer data.
- Practicing SQL skills on a small business dataset.

## Author
Tanuja Shejal

Banking Analytics SQL Project
Project Overview

This project analyzes banking data across customers, accounts, transactions, loans, and branches using SQL. The objective is to identify high-value customers, evaluate loan exposure, analyze branch performance, and generate actionable business insights for banking operations.

Business Problem

Analyze customer accounts, transactions, loans, and branch performance to identify high-value customers, understand transaction behavior, evaluate loan exposure, and generate actionable business insights for banking operations.

Dataset Information

The project uses five related banking tables:

Customers
Accounts
Transactions
Loans
Branches
Tools Used
MySQL Workbench
SQL
SQL Concepts Applied
Joins
Aggregations (COUNT, SUM, AVG)
GROUP BY
ORDER BY
HAVING
CASE WHEN
Subqueries
Common Table Expressions (CTEs)
Window Functions (RANK)
COUNT(DISTINCT)
Key Findings
The bank serves 648 customers across 3,000 accounts.
The dataset contains 15,000 transactions and 1,500 loan records.
Checking accounts are the most common account type (1,061 accounts).
Branch B00023 has the highest loan portfolio with a total loan amount of 224,067,666.
Customer C00892 has the highest total loan exposure at 75,723,534.
High-value accounts were identified using balance-based customer segmentation.
Branch-wise ranking was performed to identify the highest-balance account in each branch.
Data quality checks revealed duplicate customer IDs in the customer dataset, highlighting the importance of validation before reporting.
Project Outcome

Developed 20 business-focused SQL queries to analyze customer behavior, account performance, loan exposure, and branch performance. The project demonstrates practical use of SQL for business intelligence and banking analytics.
# Banking Analytics SQL Project

## Project Overview

This project analyzes banking data across customers, accounts, transactions, loans, and branches using SQL. The objective is to identify high-value customers, evaluate loan exposure, analyze branch performance, and generate actionable business insights for banking operations.

## Business Problem

Analyze customer accounts, transactions, loans, and branch performance to identify high-value customers, understand transaction behavior, evaluate loan exposure, and support better business decisions.

## Dataset Information

The project uses five related banking tables:

* Customers
* Accounts
* Transactions
* Loans
* Branches

**Source:** Kaggle — Bank Dataset by salikhussaini49

## Tools Used

* MySQL Workbench
* SQL

## SQL Concepts Applied

* Joins
* Aggregations (COUNT, SUM, AVG)
* GROUP BY
* ORDER BY
* HAVING
* CASE WHEN
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions (RANK)
* COUNT(DISTINCT)

## Key Findings

* The bank serves 648 customers across 3,000 accounts.
* The dataset contains 15,000 transactions and 1,500 loan records.
* Checking accounts are the most common account type (1,061 accounts).
* Branch B00023 has the highest loan portfolio with a total loan amount of 224,067,666.
* Customer C00892 has the highest total loan exposure at 75,723,534.
* High-value accounts were identified using balance-based customer segmentation.
* Branch-wise ranking was performed to identify the highest-balance account in each branch.

## Project Outcome

Developed 20 business-focused SQL queries to analyze customer behavior, account performance, loan exposure, and branch performance. The project demonstrates practical use of SQL for business intelligence and banking analytics in the BFSI domain.

## Repository Contents

* `banking_analytics_project.sql` — All 20 SQL queries organized by phase.
* `README.md` — Project documentation.


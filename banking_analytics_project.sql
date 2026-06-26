CREATE DATABASE banking_analysis;
USE banking_analysis;

RENAME TABLE bank_customer_data TO customers;
RENAME TABLE bank_account_data TO accounts;
RENAME TABLE bank_transaction_data TO transactions;
RENAME TABLE bank_loan_data TO loans;
RENAME TABLE bank_branch_data TO branches;

RENAME TABLE bank_transacation_data TO transactions;

SHOW TABLES;

SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_accounts FROM accounts;
SELECT COUNT(*) AS total_transactions FROM transactions;
SELECT COUNT(*) AS total_loans FROM loans;
SELECT COUNT(*) AS total_branches FROM branches;


-- Query 1: Customer Base Analysis –> Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Query 2: Account Portfolio Analysis –> Total Accounts

SELECT COUNT(*) AS total_accounts
FROM accounts;

-- Query 3: Loan Portfolio Analysis – Total Loans

SELECT COUNT(*) AS total_loans
FROM loans;

-- Query 4: Transaction Activity Analysis – Total Transactions

SELECT COUNT(*) AS total_transactions
FROM transactions;

-- -- Query 5: Branch Network Analysis – Total Branches

SELECT COUNT(*) AS total_branches
FROM branches;

-- -- Query 6: Account Status Analysis – Active vs Closed Accounts

SELECT ACCOUNT_STATUS,
       COUNT(*) AS account_count
FROM accounts
GROUP BY ACCOUNT_STATUS;

-- -- Query 7: Account Type Analysis –> Distribution of Account Types
SELECT 
    ACCOUNT_TYPE, COUNT(*) AS account_count
FROM
    accounts
GROUP BY ACCOUNT_TYPE
ORDER BY account_count DESC;

-- Query 8: Branch Performance Analysis – Accounts Managed by Each Branch
SELECT
    b.BRANCH_ID,
    COUNT(a.ACCOUNT_ID) AS total_accounts
FROM branches b
JOIN accounts a
    ON b.BRANCH_ID = a.BRANCH_ID
GROUP BY b.BRANCH_ID
ORDER BY total_accounts DESC;

DESC transactions;
desc customers;
desc accounts;
-- Query 9: Customer Transaction Analysis -> Top Customers by Number of Transactions
SELECT
    c.CUSTOMER_ID,
    c.First_Name,
    c.Last_Name,
    COUNT(*) AS total_transactions
FROM customers c
JOIN accounts a
    ON c.CUSTOMER_ID = a.CUSTOMER_ID
JOIN transactions t
    ON a.ACCOUNT_ID = t.ACCOUNT_ID
GROUP BY
    c.CUSTOMER_ID,
    c.First_Name,
    c.Last_Name
ORDER BY total_transactions DESC
LIMIT 10;


-- Query 10: Customer Segmentation Analysis -> Customers by Occupation
SELECT
    Occupation,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Occupation
ORDER BY customer_count DESC;

-- Query 11: Branch Performance Analysis -> Branches with More Than 60 Accounts
SELECT
    BRANCH_ID,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY BRANCH_ID
HAVING COUNT(*) > 60
ORDER BY total_accounts DESC;

-- Query 12: Customer Demographics Analysis -> Customers by City
SELECT
    City,
    COUNT(*) AS customer_count
FROM customers
GROUP BY City
ORDER BY customer_count DESC
LIMIT 10;

-- Query 13: Customer Segmentation Analysis -> High, Medium, and Low Balance Accounts
SELECT
    ACCOUNT_ID,
    OPENING_BALANCE,
    CASE
        WHEN OPENING_BALANCE >= 700000 THEN 'High Value'
        WHEN OPENING_BALANCE >= 300000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM accounts;

-- Query 14: High-Value Accounts Above Average Balance
SELECT
    ACCOUNT_ID,
    OPENING_BALANCE
FROM accounts
WHERE OPENING_BALANCE >
(
    SELECT AVG(OPENING_BALANCE)
    FROM accounts
)
ORDER BY OPENING_BALANCE DESC;

-- Query 15: Customer Ranking Analysis -> Top 10 Accounts by Opening Balance

SELECT
    ACCOUNT_ID,
    OPENING_BALANCE,
    RANK() OVER (ORDER BY OPENING_BALANCE DESC) AS balance_rank
FROM accounts
LIMIT 10;

-- Query 16: High Value Accounts Analysis -> CTE
WITH high_balance_accounts AS
(
    SELECT
        ACCOUNT_ID,
        OPENING_BALANCE
    FROM accounts
    WHERE OPENING_BALANCE >
    (
        SELECT AVG(OPENING_BALANCE)
        FROM accounts
    )
)
SELECT COUNT(*) AS high_value_accounts
FROM high_balance_accounts;

-- Query 17: Loan Portfolio Analysis -> Top 10 Customers by Total Loan Amount
SELECT
    CUSTOMER_ID,
    SUM(LOAN_AMOUNT) AS total_loan_amount
FROM loans
GROUP BY CUSTOMER_ID
ORDER BY total_loan_amount DESC
LIMIT 10;

-- Query 18: Customer Loan & Account Analysis -> Top Customers by
--  Total Loan Amount with Account Information

SELECT
    c.CUSTOMER_ID,
    c.First_Name,
    c.Last_Name,
    COUNT(DISTINCT a.ACCOUNT_ID) AS total_accounts,
    SUM(l.LOAN_AMOUNT) AS total_loan_amount
FROM customers c
JOIN accounts a
    ON c.CUSTOMER_ID = a.CUSTOMER_ID
JOIN loans l
    ON c.CUSTOMER_ID = l.CUSTOMER_ID
GROUP BY
    c.CUSTOMER_ID,
    c.First_Name,
    c.Last_Name
ORDER BY total_loan_amount DESC
LIMIT 10;

-- Query 19: Branch Loan Analysis -> Top Branches by Total Loan Amount

SELECT
    BRANCH_ID,
    SUM(LOAN_AMOUNT) AS total_loan_amount
FROM loans
GROUP BY BRANCH_ID
ORDER BY total_loan_amount DESC
LIMIT 10;

-- Query 20: Branch-wise Top Accounts by Opening Balance
WITH ranked_accounts AS
(
    SELECT
        BRANCH_ID,
        ACCOUNT_ID,
        OPENING_BALANCE,
        RANK() OVER
        (
            PARTITION BY BRANCH_ID
            ORDER BY OPENING_BALANCE DESC
        ) AS balance_rank
    FROM accounts
)

SELECT
    BRANCH_ID,
    ACCOUNT_ID,
    OPENING_BALANCE,
    balance_rank
FROM ranked_accounts
WHERE balance_rank = 1;
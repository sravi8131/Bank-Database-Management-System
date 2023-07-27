CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(200),
  contact_number VARCHAR(15),
  email VARCHAR(100)
);

CREATE TABLE Accounts (
  account_number INT PRIMARY KEY,
  customer_id INT,
  balance DECIMAL(10, 2),
  account_type VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  account_number INT,
  transaction_date DATE,
  amount DECIMAL(10, 2),
  type VARCHAR(10),
  FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

CREATE TABLE Branches (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(100),
  location VARCHAR(200),
  contact_number VARCHAR(15)
);

INSERT INTO Customers (customer_id, name, address, contact_number, email)
VALUES
  (1, 'John Smith', '123 Main St, City, Country', '+1 123-456-7890', 'john.smith@example.com'),
  (2, 'Jane Doe', '456 Park Ave, Town, Country', '+1 987-654-3210', 'jane.doe@example.com');

INSERT INTO Accounts (account_number, customer_id, balance, account_type)
VALUES
  (1001, 1, 5000.00, 'Savings'),
  (2001, 2, 10000.00, 'Checking');

INSERT INTO Transactions (transaction_id, account_number, transaction_date, amount, type)
VALUES
  (1, 1001, '2023-07-01', 2000.00, 'Credit'),
  (2, 2001, '2023-07-02', 1500.00, 'Credit');

INSERT INTO Branches (branch_id, branch_name, location, contact_number)
VALUES
  (101, 'Main Branch', '123 Main St, City, Country', '+1 555-555-5555'),
  (102, 'Town Branch', '456 Park Ave, Town, Country', '+1 777-777-7777');
  
--Retrieve all accounts of a specific customer:
SELECT * FROM Accounts WHERE customer_id = 1;

--Find the total balance of all accounts in the bank
SELECT SUM(balance) AS total_balance FROM Accounts;

--Get the transaction history of a particular account:
SELECT * FROM Transactions WHERE account_number = 1001;

--Calculate the average balance of accounts by account type:
SELECT account_type, AVG(balance) AS average_balance
FROM Accounts
GROUP BY account_type;

--List all customers with their account details:
SELECT c.customer_id, c.name, c.address, c.contact_number, a.account_number, a.balance, a.account_type
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;


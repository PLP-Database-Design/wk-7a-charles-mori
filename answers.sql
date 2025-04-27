-- Question 1: Achieving 1NF

-- Step 1: Create the new 1NF table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Insert the transformed data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ---------------------------------------------------------------

-- Question 2: Achieving 2NF

-- Step 1: Create a separate table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255)
);

-- Step 2: Create a new table for Orders
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 3: Insert data into Customers table
INSERT INTO Customers (CustomerName) VALUES
('John Doe'),
('Jane Smith'),
('Emily Clark');

-- Step 4: Insert data into Orders table
-- Assuming CustomerID: John Doe -> 1, Jane Smith -> 2, Emily Clark -> 3
INSERT INTO Orders (OrderID, CustomerID, Product, Quantity) VALUES
(101, 1, 'Laptop', 2),
(101, 1, 'Mouse', 1),
(102, 2, 'Tablet', 3),
(102, 2, 'Keyboard', 1),
(102, 2, 'Mouse', 2),
(103, 3, 'Phone', 1);

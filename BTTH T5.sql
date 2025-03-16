CREATE DATABASE QLSP
USE QLSP
CREATE TABLE Suppliers (SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL);
CREATE TABLE Products (ProductID int not null primary key,
	ProductName nvarchar(60),
	SupplierID int,
	UnitPrice nvarchar(30),
	UnitInStock nvarchar (30),
	foreign key (SupplierID) REFERENCES Suppliers (SupplierID));
CREATE TABLE Customers (CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    Address TEXT,
    City VARCHAR(100),
    Region VARCHAR(100),
    Country VARCHAR(100));
CREATE TABLE Employees (EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(100) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    City VARCHAR(100));
CREATE TABLE Orders (OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID));
CREATE TABLE OrderDetails (OrderID INT,
    ProductID INT,
    UnitPrice nvarchar(30),
    Quantity INT,
    Discount nvarchar(5),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'ABC Supplies'),
(2, 'XYZ Distributors'),
(3, 'Fresh Foods Inc.'),
(4, 'Tech Gadgets Ltd.'),
(5, 'Home Essentials Co.');
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock) VALUES
(1, N'Laptop Dell', 4, '1200', '50'),
(2, N'Bàn phím cơ', 4, '80', '200'),
(3, N'Rau sạch', 3, '10', '500'),
(4, N'Bột giặt', 5, '5', '300'),
(5, N'Nước giải khát', 3, '2', '1000');
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country) VALUES
(1, 'Tech Corp', '123 Tech Street', 'Hanoi', 'North', 'Vietnam'),
(2, 'Green Groceries', '456 Market Lane', 'Ho Chi Minh City', 'South', 'Vietnam'),
(3, 'ABC Traders', '789 Business Road', 'Da Nang', 'Central', 'Vietnam'),
(4, 'XYZ Retailers', '101 Commerce Ave', 'Can Tho', 'South', 'Vietnam'),
(5, 'Home Living', '202 Cozy St', 'Hai Phong', 'North', 'Vietnam');
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City) VALUES
(1, 'Nguyen', 'Anh', '1990-05-12', 'Hanoi'),
(2, 'Tran', 'Binh', '1985-08-23', 'Ho Chi Minh City'),
(3, 'Le', 'Cuong', '1992-03-15', 'Da Nang'),
(4, 'Pham', 'Dung', '1988-11-30', 'Can Tho'),
(5, 'Hoang', 'Evy', '1995-07-19', 'Hai Phong');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(1, 1, 2, '2025-03-01'),
(2, 2, 1, '2025-03-02'),
(3, 3, 3, '2025-03-03'),
(4, 4, 4, '2025-03-04'),
(5, 5, 5, '2025-03-05');
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(1, 1, '1200', 2, '0'),
(1, 2, '80', 5, '5'),
(2, 3, '10', 10, '2'),
(3, 4, '5', 20, '1'),
(4, 5, '2', 50, '3');
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country) VALUES (6, 'Cong Ty ABC', '123 Duong Nguyen Trai', 'Ha Noi', 'Dong Bac', 'Vietnam');
INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City) VALUES (6, 'Nguyen', 'An', '1990-05-15', 'Ha Noi');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES (6, 6, 6, '1997-01-10');
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(7, 8, 1, '1997-07-05'),
(8, 7, 3, '1997-07-09'),
(9, 9, 4, '1997-07-06'),
(10, 10, 5, '1997-07-08');

INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country) VALUES
(7, 'VinGroup', '345 Tech Street', 'Haiphong', 'North', 'Vietnam'),
(8, 'Coffe house', '789 Market Lane', 'Ho Chi Minh City', 'South', 'Vietnam'),
(9, 'Vietcombank ', '1012 Business Road', 'Hue', 'Central', 'Vietnam'),
(10, 'FPT retails', '108 Commerce Ave', 'Can Tho', 'South', 'Vietnam');
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country) VALUES
(11, 'GRAB', '354 Tech Street', 'Haiphong', 'North', 'Vietnam'),
(12, 'HIGLAND', '909 Market Lane', 'Ho Chi Minh City', 'South', 'Vietnam'),
(13, 'AGRIBANK ', '102 Business Road', 'Hue', 'Central', 'Vietnam'),
(14, 'CONGNGHIEP retails', '118 Commerce Ave', 'Can Tho', 'South', 'Vietnam');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(11, 14, 2, '1997-01-08'),
(12, 13, 1, '1997-01-10'),
(13, 12, 3, '1997-01-11'),
(14, 11, 4, '1997-01-12');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(19, 5, 2, '1996-07-16'),
(20, 4, 1, '1996-07-16'),
(21, 3, 3, '1996-07-16'),
(22, 2, 4, '1996-07-16');
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(19, 1, '1200', 2, '0'),
(20, 2, '80', 5, '5'),
(21, 3, '10', 10, '2'),
(22, 4, '5', 20, '1');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(23, 5, 2, '1997-09-8'),
(24, 4, 1, '1997-04-6'),
(25, 3, 3, '1997-04-16'),
(26, 2, 4, '1997-09-26');

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City) VALUES
(7, 'FULLER', 'BAO', '1990-05-12', 'Hanoi'),
(8, 'FULLER', 'HOA', '1985-08-23', 'Ho Chi Minh City'),
(9, 'FULLER', 'VU', '1992-03-15', 'Da Nang'),
(10, 'FULLER', 'ANH', '1988-11-30', 'Can Tho'),
(11, 'FULLER', 'CUONG', '1995-07-19', 'Hai Phong');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(27, 5, 7, '1997-09-8'),
(28, 4, 8, '1997-04-6'),
(29, 3, 9, '1997-04-16'),
(30, 2, 10, '1997-09-26'),
(31, 1, 11, '1997-09-28');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(32, 5, 7, '1997-09-8'),
(33, 4, 8, '1997-04-6'),
(34, 3, 9, '1997-04-16'),
(35, 2, 10, '1997-09-26'),
(36, 1, 11, '1997-09-28');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(10248, 5, 7, '1997-09-8');
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(10248, 1, '1200', 2, '0');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(37, 5, 7, '1997-09-8'),
(38, 4, 8, '1997-04-6'),
(39, 3, 9, '1997-04-16'),
(40, 2, 10, '1997-09-26'),
(41, 1, 11, '1997-09-28');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(42, 5, 7, '1996-09-8'),
(43, 4, 8, '1996-04-6');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES
(44, 5, 7, '1996-12-7'),
(45, 4, 8, '1996-12-7');



INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES 
(44, 5, '1', 2, '0'),
(45, 5, '1', 2, '0');

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City) VALUES
(12, 'FULLER', 'BAO', '1990-05-12', 'Hanoi'),
(13, 'FULLER', 'HOA', '1985-08-23', 'Ho Chi Minh City');

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate) VALUES 
(46, 4, 7, '1996-12-15'),
(47, NULL, 7, '1996-12-15');


ALTER TABLE Orders ADD RequiredDate DATE

CAU 1:
SELECT Customers.CustomerID, Customers.CompanyName, Customers.Address, Orders.OrderID, Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 7
ORDER BY Customers.CustomerID, Orders.OrderDate DESC;

CAU 2:
SELECT *
FROM Customers 
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = 1997 AND MONTH(OrderDate) = 1 AND DAY(OrderDate) <= 15;

CAU 3:
SELECT Products.ProductID, Products.ProductName, Orderdetails.OrderID, Orders.OrderDate  
FROM OrderDetails  
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID  
JOIN Products ON OrderDetails.ProductID = Products.ProductID  
WHERE Orders.OrderDate = '1996-07-16';

CAU 4:
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate, Orders.RequiredDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE YEAR(Orders.OrderDate) = 1997 AND MONTH(Orders.OrderDate) IN (4, 9)
ORDER BY Customers.CompanyName, Orders.OrderDate DESC;

CAU 5:***
SELECT *
FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE Employees.LastName = 'FULLER'

CAU 6 : Liệt kê danh sách các Products do nhà cung cấp (supplier) có mã 1,3,6 bán được trong tháng quý 2 của năm 1997, được sắp xếp theo mã nhà cung cấp (SupplierID), cùng mã nhà cung cấp thì sắp xếp theo ProductID**/
SELECT *
FROM Products
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
JOIN Orders ON Orders.OrderID = Orders.OrderID 
WHERE Suppliers.SupplierID IN ('1','3','6')
AND MONTH(Orders.OrderDate) BETWEEN '4' AND '6'
ORDER BY Suppliers.SupplierID, Products.ProductID;

CAU 7: 
SELECT *
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.UnitPrice = OrderDetails.UnitPrice

CAU 8
Select *FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.OrderID = '10248';
cau 9


SELECT *
FROM Employees 
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE YEAR(Orders.OrderDate) = '1996' AND MONTH(Orders.OrderDate) = '7';

CAU 10: 
SELECT Products.ProductID, Products.ProductName, Orders.OrderID, Orders.OrderDate, Orders.CustomerID, Products.UnitPrice, OrderDetails.Quantity, (OrderDetails.Quantity * Products.UnitPrice) AS ToTal
FROM Products, Orders, OrderDetails
WHERE Products.ProductID = OrderDetails.ProductID
    AND OrderDetails.OrderID = Orders.OrderID
    AND YEAR(Orders.OrderDate) = 1996
    AND MONTH(Orders.OrderDate) = 12
    AND (DATEPART(weekday, Orders.OrderDate) = 7 OR DATEPART(weekday, Orders.OrderDate) = 1)
ORDER BY Products.ProductID, OrderDetails.Quantity DESC;

CAU11
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeName, O.OrderID,
O.OrderDate, OD.ProductID, OD.Quantity, OD.UnitPrice,
    OD.Quantity * OD.UnitPrice AS Total
FROM Employees E, Orders O, OrderDetails OD
WHERE E.EmployeeID = O.EmployeeID
    AND O.OrderID = OD.OrderID
    AND YEAR(O.OrderDate) = 1996

CAU12:
SELECT *
FROM ORDERS 
WHERE YEAR(OrderDate)=1996
AND MONTH(OrderDate)= 12
AND DATEPART(weekday, OrderDate) = 7

CAU 13
SELECT * 
FROM Employees
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.OrderID IS NULL

CAU 14
SELECT * 
FROM Products
RIGHT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.OrderID IS NULL

cau15
SELECT *
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL







CREATE TABLE customers (
    CustomerID INT PRIMARY KEY NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    JoinDate DATE
);

INSERT INTO customers (CustomerID, CustomerName, City, State, JoinDate) VALUES
(1, 'Ali Khan', 'Karachi', 'Sindh', '2022-01-15'),
(2, 'Sara Ahmed', 'Lahore', 'Punjab', '2022-02-20'),
(3, 'John Doe', 'Islamabad', 'Islamabad', '2022-03-05'),
(4, 'Maryam Ilyas', 'Karachi', 'Sindh', '2022-03-18'),
(5, 'Bilal Sheikh', 'Faisalabad', 'Punjab', '2022-04-01'),
(6, 'Fatima Noor', 'Quetta', 'Balochistan', '2022-05-12');

CREATE TABLE Cars (
    CarID INT PRIMARY KEY NOT NULL,
    Model VARCHAR(100) NOT NULL,
    Brand VARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    Price NUMERIC(10,2) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    InventoryCount INT NOT NULL
);

INSERT INTO Cars (CarID, Model, Brand, Year, Price, Color, InventoryCount) VALUES
(1, 'Civic', 'Honda', 2022, 4500000.00, 'White', 5),
(2, 'City', 'Honda', 2021, 3200000.00, 'Black', 3),
(3, 'Corolla', 'Toyota', 2022, 4000000.00, 'Silver', 4),
(4, 'Yaris', 'Toyota', 2021, 3000000.00, 'Red', 6),
(5, 'Model S', 'Tesla', 2023, 15000000.00, 'White', 2),
(6, 'Model 3', 'Tesla', 2023, 8000000.00, 'Blue', 3),
(7, 'Accord', 'Honda', 2023, 7000000.00, 'Grey', 2),
(8, 'Hilux', 'Toyota', 2023, 8500000.00, 'Black', 4),
(9, 'Sonata', 'Hyundai', 2022, 6500000.00, 'Blue', 3),
(10, 'Elantra', 'Hyundai', 2021, 4000000.00, 'Silver', 5);
(11, 'Jazz', 'Honda', 2023, 2500000.00, 'Yellow', 3),
(12, 'Pilot', 'Honda', 2023, 9000000.00, 'Black', 2),
(13, 'CR-V', 'Honda', 2023, 7500000.00, 'Blue', 4),
(14, 'Insight', 'Honda', 2023, 4500000.00, 'Green', 2);

CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Salespersons (SalespersonID, Name, Department, HireDate) VALUES
(1, 'Ahmed Raza', 'Sales', '2020-01-15'),
(2, 'Sana Malik', 'Sales', '2019-06-20'),
(3, 'Omar Khan', 'Luxury Sales', '2021-03-10'),
(4, 'Fatima Shah', 'Corporate Sales', '2018-11-05'),
(5, 'Ali Hamza', 'Sales', '2022-04-01');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY NOT NULL,
    CustomerID INT REFERENCES customers(CustomerID),
    CarID INT REFERENCES Cars(CarID),
    SaleDate DATE,
    SalePrice NUMERIC(15, 2),
    SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

INSERT INTO Sales (SaleID, CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES
(1, 1, 1, '2022-02-01', 4500000.00, 1),
(2, 2, 3, '2022-03-10', 4000000.00, 2),
(3, 3, 5, '2022-04-15', 15000000.00, 3),
(4, 4, 2, '2022-05-20', 3200000.00, 4),
(5, 5, 8, '2022-06-05', 8500000.00, 5),
(6, 6, 6, '2022-06-18', 8000000.00, 1),
(7, 1, 9, '2022-07-10', 6500000.00, 2),
(8, 2, 4, '2022-07-25', 3000000.00, 3),
(9, 3, 7, '2022-08-15', 7000000.00, 4),
(10, 4, 10, '2022-09-05', 4000000.00, 5);

CREATE TABLE ServiceRecords (
    RecordID INT PRIMARY KEY NOT NULL,
    CarID INT REFERENCES Cars(CarID),
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost NUMERIC(10, 2),
    TechnicianID INT
);

INSERT INTO ServiceRecords (RecordID, CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, 1, '2022-03-01', 'Oil Change', 5000.00, 101),
(2, 3, '2022-03-15', 'Tire Replacement', 20000.00, 102),
(3, 5, '2022-04-20', 'Battery Replacement', 80000.00, 103),
(4, 2, '2022-05-25', 'Brake Service', 15000.00, 104),
(5, 8, '2022-06-10', 'Engine Tuning', 25000.00, 105),
(6, 6, '2022-06-22', 'Air Filter Replacement', 7000.00, 101),
(7, 9, '2022-07-12', 'Transmission Repair', 120000.00, 102),
(8, 4, '2022-07-28', 'Oil Change', 5000.00, 103),
(9, 7, '2022-08-18', 'Tire Replacement', 20000.00, 104),
(10, 10, '2022-09-08', 'Battery Replacement', 80000.00, 105);
(11, 5, 1, '2022-02-05', 4600000.00, 1),
(12, 6, 3, '2022-02-10', 4100000.00, 2),
(13, 2, 5, '2022-02-12', 15100000.00, 3),
(14, 3, 2, '2022-02-15', 3300000.00, 4),
(15, 4, 8, '2022-02-20', 8600000.00, 5),
(16, 1, 6, '2022-02-22', 8100000.00, 1),
(17, 5, 9, '2022-02-24', 6600000.00, 2),
(18, 6, 4, '2022-02-25', 3100000.00, 3),
(19, 2, 7, '2022-02-26', 7100000.00, 4),
(20, 3, 10, '2022-02-27', 4100000.00, 5),
(21, 4, 1, '2022-02-28', 4550000.00, 1),
(22, 5, 3, '2022-02-28', 4050000.00, 2),
(23, 6, 5, '2022-02-28', 15050000.00, 3),
(24, 1, 2, '2022-02-28', 3250000.00, 4),
(25, 2, 8, '2022-02-28', 8550000.00, 5),
(26, 3, 6, '2022-02-28', 8050000.00, 1),
(27, 4, 9, '2022-02-28', 6550000.00, 2),
(28, 5, 4, '2022-02-28', 3050000.00, 3),
(29, 6, 7, '2022-02-28', 7050000.00, 4),
(30, 1, 10, '2022-02-28', 4050000.00, 5);

--Part 1
SELECT COUNT(*) AS TotalCustomers FROM customers;
SELECT AVG(SalePrice) AS AvgSalePrice FROM Sales;
SELECT MAX(SalePrice) AS MaxSalePrice FROM Sales;
SELECT SUM(InventoryCount) AS TotalInventory FROM Cars;
SELECT MIN(SaleDate) AS EarliestSale, MAX(SaleDate) AS MostRecentSale FROM Sales;

--Part 2
SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand;
SELECT sp.Name, SUM(s.SalePrice) AS TotalSales
FROM Sales s
JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY sp.Name;
SELECT c.Model, AVG(s.SalePrice) AS AveragePrice
FROM Sales s
JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model;
SELECT ServiceType, AVG(Cost) AS AverageCost
FROM ServiceRecords
GROUP BY ServiceType;
SELECT Brand, Color, COUNT(*) AS CarCount
FROM Cars
GROUP BY Brand, Color;

--Part 3
SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand
HAVING COUNT(DISTINCT Model) > 5;
SELECT c.Model, COUNT(*) AS SalesCount
FROM Sales s
JOIN Cars c ON s.CarID = c.CarID
GROUP BY c.Model
HAVING COUNT(*) > 10;
SELECT sp.Name, AVG(s.SalePrice) AS AverageSalePrice
FROM Sales s
JOIN Salespersons sp ON s.SalespersonID = sp.SalespersonID
GROUP BY sp.Name
HAVING AVG(SalePrice) > 50000;
SELECT TO_CHAR(SaleDate, 'YYYY-MM') AS SaleMonth, COUNT(*) AS SalesCount
FROM Sales
GROUP BY SaleMonth
HAVING COUNT(*) > 20;
SELECT ServiceType, AVG(Cost) AS AverageCost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 500;

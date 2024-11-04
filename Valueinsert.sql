-- Table: dim_customers
CREATE TABLE dim_customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(50),
    DateOfBirth DATE,
    Location VARCHAR(255),
    Age INT,
    Gender VARCHAR(10)
);

INSERT INTO dim_customers (CustomerID, Name, Email, Phone, DateOfBirth, Location, Age, Gender) 
VALUES 
    (1, 'Nguyen Van A', 'nva@example.com', '0123456789', '1990-05-15', 'Hanoi', 33, 'Male'),
    (2, 'Tran Thi B', 'ttb@example.com', '0987654321', '1985-10-22', 'Ho Chi Minh City', 38, 'Female'), 
    (3, 'Le Van C', 'lvc@example.com', '0123456780', '1992-01-10', 'Da Nang', 32, 'Male'),
    (4, 'Nguyen Thi D', 'ntd@example.com', '0987654320', '1988-03-22', 'Hai Phong', 36, 'Female'),
    (5, 'Tran Van E', 'tve@example.com', '0123456790', '1985-12-15', 'Can Tho', 38, 'Male');

-- Table: dim_campaigns
CREATE TABLE dim_campaigns (
    CampaignID INT PRIMARY KEY,
    Name VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    Objective VARCHAR(255)
);

INSERT INTO dim_campaigns (CampaignID, Name, StartDate, EndDate, Budget, Objective) 
VALUES 
    (1, 'Summer Sale 2024', '2024-06-01', '2024-08-31', 5000000.00, 'Increase Sales'),
    (2, 'Back to School 2024', '2024-08-01', '2024-09-30', 3000000.00, 'Engage Students'), 
    (3, 'Holiday Sale 2024', '2024-11-01', '2024-12-31', 7000000.00, 'Boost Holiday Sales'),
    (4, 'New Year Promotion 2025', '2024-12-15', '2025-01-15', 4000000.00, 'Attract New Customers');

-- Table: dim_channels
CREATE TABLE dim_channels (
    ChannelID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description VARCHAR(255)
);

INSERT INTO dim_channels (ChannelID, Name, Description) 
VALUES 
    (1, 'Facebook Ads', 'Advertising on Facebook'),
    (2, 'Google Ads', 'Advertising on Google'), 
    (3, 'Instagram Ads', 'Advertising on Instagram'),
    (4, 'Email Marketing', 'Promotional emails to customers');

-- Table: dim_suppliers
CREATE TABLE dim_suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    Contact VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255),
    Notes VARCHAR(255)
);

INSERT INTO dim_suppliers (SupplierID, SupplierName, Contact, Email, Address, Notes) 
VALUES 
    (1, 'ABC Supplies', 'Mr. Le', 'contact@abc.com', '123 ABC Street, Hanoi', 'Reliable supplier'),
    (2, 'XYZ Co.', 'Ms. Pham', 'info@xyz.com', '456 XYZ Avenue, Ho Chi Minh City', 'Fast delivery'), 
    (3, 'DEF Products', 'Mr. Nguyen', 'contact@def.com', '789 DEF Boulevard, Hanoi', 'Good quality products'),
    (4, 'GHI Supplies', 'Ms. Nguyen', 'info@ghi.com', '101 GHI Road, Ho Chi Minh City', 'Excellent service');

-- Table: dim_products
CREATE TABLE dim_products (
    ProductID INT PRIMARY KEY,
    SupplierID INT,
    Name VARCHAR(255),
    CategoryID INT,
    Price DECIMAL(15, 2),
    Description VARCHAR(255),
    FOREIGN KEY (SupplierID) REFERENCES dim_suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES dim_prodcategory(CategoryID)
);

INSERT INTO dim_products (ProductID, SupplierID, Name, CategoryID, Price, Description) 
VALUES 
    (1, 1, 'Laptop', 1, 15000000.00, 'High-end laptop'),
    (2, 2, 'Smartphone', 2, 7000000.00, 'Latest model smartphone'), 
    (3, 3, 'Tablet', 1, 9000000.00, 'Latest model tablet'),
    (4, 4, 'Smartwatch', 2, 3000000.00, 'Water-resistant smartwatch');

-- Table: dim_prodcategory
CREATE TABLE dim_prodcategory (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

INSERT INTO dim_prodcategory (CategoryID, CategoryName) 
VALUES 
    (1, 'Electronics'),
    (2, 'Mobiles'), 
    (3, 'Tablets'),
    (4, 'Wearables');
-- Table: orders
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Created_at DATETIME,
    CampaignID INT,
    ShippedDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES dim_customers(CustomerID),
    FOREIGN KEY (CampaignID) REFERENCES dim_campaigns(CampaignID)
);

INSERT INTO orders (OrderID, CustomerID, Created_at, CampaignID, ShippedDate) 
VALUES 
    (1, 1, '2024-07-10 14:30:00', 1, '2024-07-15'),
    (2, 2, '2024-09-05 10:00:00', 2, '2024-09-10'), 
    (3, 3, '2024-11-10 11:00:00', 3, '2024-11-15'),
    (4, 4, '2024-12-20 09:30:00', 4, '2024-12-25'),
    (5, 1, '2024-07-15 10:00:00', 1, '2024-07-20'),  
    (6, 2, '2024-09-10 15:45:00', 2, '2024-09-15'),  
    (7, 3, '2024-11-12 12:30:00', 3, '2024-11-18'), 
    (8, 4, '2024-12-25 09:00:00', 4, '2024-12-30'),
    (9, 1, '2024-06-15 11:45:00', 1, '2024-06-18'),  
    (10, 2, '2024-06-17 14:00:00', 1, '2024-06-20'),
    (11, 3, '2024-06-25 10:30:00', 1, '2024-06-28'), 
    (12, 4, '2024-06-30 08:15:00', 1, '2024-07-02'),
    (13, 5, '2024-08-01 13:00:00', 2, '2024-08-05'), 
    (14, 1, '2024-08-07 16:20:00', 2, '2024-08-10'), 
    (15, 2, '2024-08-12 12:45:00', 2, '2024-08-15'),
    (16, 3, '2024-08-18 09:00:00', 2, '2024-08-20'),
    (17, 4, '2024-11-10 11:30:00', 3, '2024-11-15'),
    (18, 5, '2024-11-15 15:00:00', 3, '2024-11-18'),
    (19, 2, '2024-11-20 10:10:00', 3, '2024-11-23'), 
    (20, 3, '2024-11-22 09:45:00', 3, '2024-11-25'), 
    (21, 1, '2024-12-18 10:30:00', 4, '2024-12-22'), 
    (22, 3, '2024-12-20 14:40:00', 4, '2024-12-25'),
    (23, 4, '2024-12-24 09:50:00', 4, '2024-12-28'),
    (24, 5, '2024-12-28 16:30:00', 4, '2025-01-02');
    (25, 1, '2024-06-02 10:30:00', 1, '2024-06-06'),
    (26, 3, '2024-06-10 09:00:00', 1, '2024-06-14'),
    (27, 4, '2024-06-18 15:20:00', 1, '2024-06-22'),
    (28, 5, '2024-08-01 13:00:00', 2, '2024-08-05'),
    (29, 2, '2024-08-03 11:40:00', 2, '2024-08-07'),
    (30, 3, '2024-08-05 10:15:00', 2, '2024-08-08'),
    (31, 1, '2024-08-10 12:45:00', 2, '2024-08-12'),
    (32, 4, '2024-08-14 16:00:00', 2, '2024-08-17'),
    (33, 5, '2024-08-16 10:35:00', 2, '2024-08-18'),
    (34, 1, '2024-11-01 08:50:00', 3, '2024-11-05'),
    (35, 3, '2024-11-08 14:30:00', 3, '2024-11-12'),
    (36, 4, '2024-11-11 10:00:00', 3, '2024-11-15'),
    (37, 2, '2024-11-13 13:45:00', 3, '2024-11-17'),
    (38, 5, '2024-11-17 09:10:00', 3, '2024-11-21'),
    (39, 2, '2024-12-19 10:30:00', 4, '2024-12-23'),
    (40, 3, '2024-12-21 15:30:00', 4, '2024-12-25'),
    (41, 5, '2024-12-27 16:30:00', 4, '2024-12-31');

-- Table: orderdetail
CREATE TABLE orderdetail (
    ID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Revenue DECIMAL(15, 2),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES dim_products(ProductID)
);

INSERT INTO orderdetail (ID, OrderID, ProductID, Quantity, Revenue) 
VALUES 
     (1, 1, 1, 2, 30000000.00),
    (2, 2, 2, 1, 7000000.00),
    (3, 3, 1, 1, 15000000.00),
    (4, 4, 2, 3, 21000000.00),
    (5, 5, 1, 1, 15000000.00),
    (6, 6, 2, 2, 14000000.00),
    (7, 7, 1, 1, 15000000.00),
    (8, 8, 2, 1, 7000000.00),
    (9, 9, 1, 1, 15000000.00),
    (10, 10, 2, 2, 14000000.00),
    (11, 11, 1, 1, 15000000.00),
    (12, 12, 2, 3, 21000000.00),
    (13, 13, 1, 2, 30000000.00),
    (14, 14, 2, 1, 7000000.00),
    (15, 15, 1, 1, 15000000.00),
    (16, 16, 2, 2, 14000000.00),
    (17, 17, 1, 1, 15000000.00),
    (18, 18, 2, 1, 7000000.00),
    (19, 19, 1, 1, 15000000.00),
    (20, 20, 2, 3, 21000000.00),
    (21, 21, 1, 2, 30000000.00),
    (22, 22, 2, 1, 7000000.00),
    (23, 23, 1, 1, 15000000.00),
    (24, 24, 2, 2, 14000000.00),
    (25, 25, 1, 1, 15000000.00),
    (26, 26, 1, 1, 15000000.00),
    (27, 27, 2, 3, 21000000.00),
    (28, 28, 1, 1, 15000000.00),
    (29, 29, 2, 2, 14000000.00),
    (30, 30, 1, 2, 30000000.00),
    (31, 31, 2, 1, 7000000.00),
    (32, 32, 1, 1, 15000000.00),
    (33, 33, 2, 3, 21000000.00),
    (34, 34, 1, 2, 30000000.00),
    (35, 35, 2, 1, 7000000.00),
    (36, 36, 1, 1, 15000000.00),
    (37, 37, 2, 2, 14000000.00),
    (38, 38, 1, 1, 15000000.00),
    (39, 39, 1, 1, 15000000.00),
    (40, 40, 2, 1, 7000000.00),
    (41, 41, 1, 1, 15000000.00);
    

-- Table: fact_interaction
CREATE TABLE fact_interaction (
    InteractionID INT PRIMARY KEY,
    CustomerID INT,
    ChannelID INT,
    CampaignID INT,
    Date DATE,
    Type VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES dim_customers(CustomerID),
    FOREIGN KEY (ChannelID) REFERENCES dim_channels(ChannelID),
    FOREIGN KEY (CampaignID) REFERENCES dim_campaigns(CampaignID)
);

INSERT INTO fact_interaction (InteractionID, CustomerID, ChannelID, CampaignID, Date, Type) 
VALUES 
    (1, 1, 1, 1, '2024-07-05', 'Click'),
    (2, 2, 2, 2, '2024-09-02', 'View'),  
    (3, 3, 3, 3, '2024-11-05', 'Click'),
    (4, 4, 4, 4, '2024-12-22', 'View'),
    (5, 1, 1, 1, '2024-06-20', 'Click'), 
    (6, 2, 2, 2, '2024-09-03', 'View'),    
    (7, 3, 3, 3, '2024-11-01', 'Click'),  
    (8, 4, 4, 4, '2024-12-18', 'View'), 
    (9, 1, 1, 1, '2024-06-02', 'Click'),
    (10, 1, 1, 1, '2024-06-10', 'View'),
    (11, 2, 1, 1, '2024-06-15', 'Share'),
    (12, 3, 1, 1, '2024-06-18', 'Like'),
    (13, 4, 1, 1, '2024-06-22', 'Click'),
    (14, 1, 2, 1, '2024-06-05', 'View'),
    (15, 2, 2, 1, '2024-06-12', 'Click'),
    (16, 3, 2, 1, '2024-06-20', 'Share'),
    (17, 5, 2, 1, '2024-06-23', 'Like'),
    (18, 1, 2, 2, '2024-08-02', 'View'),
    (19, 4, 2, 2, '2024-08-05', 'Click'),
    (20, 5, 2, 2, '2024-08-08', 'Like'),
    (21, 2, 2, 2, '2024-08-12', 'View'),
    (22, 1, 3, 2, '2024-08-01', 'Click'),
    (23, 3, 3, 2, '2024-08-03', 'Share'),
    (24, 4, 3, 2, '2024-08-04', 'Like'),
    (25, 2, 3, 2, '2024-08-10', 'View'),
    (26, 2, 4, 3, '2024-11-03', 'Click'),
    (27, 3, 4, 3, '2024-11-06', 'View'),
    (28, 4, 4, 3, '2024-11-08', 'Click'),
    (29, 5, 4, 3, '2024-11-10', 'View'),
    (30, 2, 3, 3, '2024-11-02', 'Click'),
    (31, 3, 3, 3, '2024-11-04', 'Share'),
    (32, 1, 3, 3, '2024-11-05', 'Like'),
    (33, 5, 3, 3, '2024-11-09', 'View'),
    (34, 4, 4, 4, '2024-12-20', 'View'),
    (35, 5, 4, 4, '2024-12-22', 'Click'),
    (36, 1, 4, 4, '2024-12-24', 'Like'),
    (37, 3, 4, 4, '2024-12-26', 'View'),
    (38, 2, 1, 4, '2024-12-19', 'Click'),
    (39, 3, 1, 4, '2024-12-21', 'Like'),
    (40, 4, 1, 4, '2024-12-23', 'View'),
    (41, 5, 1, 4, '2024-12-27', 'Share');   
-- Table: camchan_on_run
CREATE TABLE camchan_on_run (
    CampaignID INT,
    ChannelID INT,
    Budget DECIMAL(15, 2),
    FOREIGN KEY (CampaignID) REFERENCES dim_campaigns(CampaignID),
    FOREIGN KEY (ChannelID) REFERENCES dim_channels(ChannelID)
);

INSERT INTO camchan_on_run (CampaignID, ChannelID, Budget) 
VALUES 
    (1, 1, 1000000.00),
    (2, 2, 500000.00), 
    (3, 3, 2000000.00),  
    (4, 4, 1000000.00), 
    (3, 4, 2500000.00),   
    (4, 3, 1500000.00);   
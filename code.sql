CREATE DATABASE StoreDB;
GO

USE StoreDB;
GO

CREATE TABLE Country (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
);

CREATE TABLE Region (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    id_country INT NOT NULL,
    FOREIGN KEY (id_country) REFERENCES Country(id)
);

CREATE TABLE City (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    id_region INT NOT NULL,
    FOREIGN KEY (id_region) REFERENCES Region(id)
);

CREATE TABLE Address (
    id INT IDENTITY PRIMARY KEY,
    street NVARCHAR(100) NOT NULL,
    id_city INT NOT NULL,
    FOREIGN KEY (id_city) REFERENCES City(id)
);

CREATE TABLE Category (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
);

CREATE TABLE Measurement (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100)
);

CREATE TABLE Markup (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    percent DECIMAL(5,2) NOT NULL
);

CREATE TABLE Producer (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    id_address INT NOT NULL,
    FOREIGN KEY (id_address) REFERENCES Address(id)
);

CREATE TABLE Supplier (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    id_address INT NOT NULL,
    FOREIGN KEY (id_address) REFERENCES Address(id)
);

CREATE TABLE Product (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    id_category INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    id_producer INT NOT NULL,
    id_measurement INT NOT NULL,
    id_markup INT NOT NULL,
    id_address INT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES Category(id),
    FOREIGN KEY (id_producer) REFERENCES Producer(id),
    FOREIGN KEY (id_measurement) REFERENCES Measurement(id),
    FOREIGN KEY (id_markup) REFERENCES Markup(id),
    FOREIGN KEY (id_address) REFERENCES Address(id)
);

CREATE TABLE Delivery (
    id INT IDENTITY PRIMARY KEY,
    id_product INT NOT NULL,
    id_supplier INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    date_of_delivery DATE NOT NULL,
    FOREIGN KEY (id_product) REFERENCES Product(id),
    FOREIGN KEY (id_supplier) REFERENCES Supplier(id)
);

CREATE TABLE Sale (
    id INT IDENTITY PRIMARY KEY,
    id_product INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    date_of_sale DATE NOT NULL,
    FOREIGN KEY (id_product) REFERENCES Product(id)
);

INSERT INTO Country (name) VALUES
('Poland'), ('Germany'), ('France'), ('Italy'), ('Spain');

INSERT INTO Region (name, id_country) VALUES
('Mazowieckie',1), ('Bavaria',2), ('Île-de-France',3), ('Lombardy',4), ('Catalonia',5);

INSERT INTO City (name, id_region) VALUES
('Warsaw',1), ('Munich',2), ('Paris',3), ('Milan',4), ('Barcelona',5);

INSERT INTO Address (street, id_city) VALUES
('Main St 1',1), ('Green Ave 2',2), ('Central Rd 3',3), ('Market Sq 4',4), ('Ocean Blvd 5',5);

INSERT INTO Category (name) VALUES
('Food'), ('Electronics'), ('Clothing'), ('Furniture'), ('Toys');

INSERT INTO Measurement (name, description) VALUES
('kg','Weight'), ('pcs','Pieces'), ('l','Liters'), ('box','Box'), ('pack','Package');

INSERT INTO Markup (name, percent) VALUES
('Low',5.00), ('Medium',10.00), ('High',20.00), ('Premium',30.00), ('Ultra',50.00);

INSERT INTO Producer (name, id_address) VALUES
('Producer A',1), ('Producer B',2), ('Producer C',3), ('Producer D',4), ('Producer E',5);

INSERT INTO Supplier (name, id_address) VALUES
('Supplier A',1), ('Supplier B',2), ('Supplier C',3), ('Supplier D',4), ('Supplier E',5);

INSERT INTO Product
(name, id_category, price, quantity, id_producer, id_measurement, id_markup, id_address)
VALUES
('Bread',1,2.50,100,1,2,1,1),
('TV',2,1200.00,10,2,2,3,2),
('T-Shirt',3,25.00,50,3,2,2,3),
('Table',4,300.00,5,4,2,4,4),
('Toy Car',5,15.00,40,5,2,2,5);

INSERT INTO Delivery
(id_product, id_supplier, price, quantity, date_of_delivery)
VALUES
(1,1,2.00,50,'2025-01-01'),
(2,2,1000.00,5,'2025-01-02'),
(3,3,20.00,20,'2025-01-03'),
(4,4,250.00,3,'2025-01-04'),
(5,5,10.00,30,'2025-01-05');

INSERT INTO Sale
(id_product, price, quantity, date_of_sale)
VALUES
(1,3.00,10,'2025-01-10'),
(2,1300.00,2,'2025-01-11'),
(3,30.00,5,'2025-01-12'),
(4,350.00,1,'2025-01-13'),
(5,20.00,8,'2025-01-14');

CREATE DATABASE TaskSQL_2

USE TaskSQL_2

CREATE TABLE Roles
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(64) NOT NULL UNIQUE
)

CREATE TABLE Users
(
	Id INT IDENTITY PRIMARY KEY,
	Username VARCHAR(64) NOT NULL UNIQUE,
	[Password] VARCHAR(64) NOT NULL,
	RolesId INT NOT NULL CONSTRAINT FK_Roles FOREIGN KEY REFERENCES Roles(Id) 
)

INSERT INTO Roles VALUES
('Checker'),('Admin'),('Moderator'),('User')


INSERT INTO Users VALUES
('ibrahim016','ibrahim123',1),('qeribqzade','qarib123',3),('rauf001','rauf123',2)


SELECT u.Username AS Username, r.[Name] AS [Role] FROM Users AS u
LEFT JOIN Roles AS r
ON u.RolesId=r.Id


------------Task2-----------


CREATE TABLE Products
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(64) NOT NULL UNIQUE,
	Price DECIMAL(6,2),
	Cost DECIMAL(6,2),
	CategoryId INT NOT NULL CONSTRAINT FK_Category FOREIGN KEY REFERENCES Categories(Id)
)

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(64) NOT NULL UNIQUE
)

CREATE TABLE Sizes
(
	Id INT IDENTITY PRIMARY KEY,
	Size FLOAT NOT NULL UNIQUE
)

CREATE TABLE ProductSize
(
	Id INT IDENTITY PRIMARY KEY,
	ProductId INT NOT NULL CONSTRAINT FK_Product FOREIGN KEY REFERENCES Products(Id),
	SizeId INT NOT NULL CONSTRAINT FK_Size FOREIGN KEY REFERENCES Sizes(Id)
)

INSERT INTO Categories VALUES
('Computer'),('Iron'),('SmartPhone'),('WashMachine')

INSERT INTO Products VALUES
('AsusRog',2400,2000,1),('AsusTuf',2000,1600,1),('Iphone15',1800,1100,3)

INSERT INTO Sizes VALUES
(25),(34),(37),(53)

INSERT INTO ProductSize VALUES
(1,1),(1,2),(2,1),(2,3)


SELECT p.[Name] AS ProductName,p.Price AS ProductPrice,c.[Name] AS CategoryName, s.Size AS ProductSize FROM Categories AS c
RIGHT JOIN Products AS p
ON c.Id=p.CategoryId
LEFT JOIN ProductSize AS ps
ON ps.ProductId=p.Id
LEFT JOIN Sizes AS s
ON ps.SizeId=s.Id
--JOIN = Zusammenführen von Tabellen
--Join Struktur/Syntax gehört zum FROM, ist quasi eine Erweiterung
--Unterschied INNER/OUTER usw. siehe Bild

--INNER JOINS:

SELECT CompanyName, OrderID FROM Customers, Orders
SELECT * FROM Customers

SELECT OrderID, CompanyName, Customers.CustomerID --, Orders.CustomerID
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID

SELECT OrderID, CompanyName 
FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID

SELECT ProductName, CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Dairy Products'


SELECT Orders.OrderID, CompanyName, Customers.CustomerID, OrderDate,
Quantity, Products.UnitPrice, Discount, Products.ProductID, ProductName,
(Products.UnitPrice * Quantity) * (1 - Discount) as PositionsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID



SELECT od.OrderID, CompanyName, Customers.CustomerID --, Orders.CustomerID
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] as od ON od.OrderID = Orders.OrderID
JOIN Employees as e ON Orders.EmployeeID = e.EmployeeID

SELECT o.OrderID, CompanyName, c.CustomerID 
FROM Customers as c
JOIN Orders as o ON o.CustomerID = c.CustomerID
JOIN [Order Details] as od ON od.OrderID = o.OrderID

SELECT o.OrderID, CompanyName, c.CustomerID 
FROM Customers as c
JOIN Orders as o ON o.CustomerID = c.CustomerID
JOIN [Order Details] as od ON o.OrderID = od.OrderID

SELECT * FROM Customers as c
JOIN Suppliers as s ON c.City = s.City


--1. Welcher Angestellte hat welche Bestellung bearbeitet? (Lastname + OrderID)

--2. Lieferkosten der Kunden aus Brazil? (CompanyName, Country, Freight)

--3. Welche Produkte hat Alfreds Futterkiste (='ALFKI') bestellt? (CompanyName, Productname)

--4. "Bonus": Welcher Angestellte kann für welche Kollegen "einspringen"?
--> welche Employees sind in der selben Stadt wohnhaft? (LastName1, City1, LastName2, City2)

SELECT e1.EmployeeID, e1.LastName, e1.City, e2.EmployeeId, e2.LastName, e2.City FROM Employees as e1
JOIN Employees as e2 ON e1.City = e2.City
WHERE e1.EmployeeID != e2.EmployeeID

--SELF JOIN (gehört zu den inner joins)


--OUTER JOINS:

SELECT * 
FROM Customers as c LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

SELECT * 
FROM Orders as o RIGHT JOIN Customers as c ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

SELECT *
FROM Orders as o FULL OUTER JOIN Customers as c ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL


--CROSS JOIN (kombiniert alles aus Table A mit allem aus Table B)

SELECT * FROM Customers CROSS JOIN Orders


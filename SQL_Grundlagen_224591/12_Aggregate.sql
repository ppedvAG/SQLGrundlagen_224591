--Aggregatfunktionen und Gruppierungen

SELECT SUM(Freight), AVG(Freight), COUNT(Freight), MIN(Freight), MAX(Freight) FROM Orders
--Count zählt nur NICHT null Einträge

--Aggregate "solo" sind einfach, funktionieren sofort
--Sobald wir Kontext zu anderen Spalten haben möchten, müssen wir gruppieren

SELECT CompanyName, City, Country, Phone, SUM(Freight) as SummeFreight
FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
--WHERE Country = 'Germany'
GROUP BY CompanyName, City, Country, Phone
ORDER BY SummeFreight DESC

--Es können nur Gruppen zusammengefasst werden, wenn ALLE angezeigten Spalten gleiche Werte haben


SELECT CompanyName, City, Country, Phone, SUM(Freight) as SummeFreight, 
AVG(Freight) as AvgFreight, COUNT(Freight) as Anzahl
FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
GROUP BY CompanyName, City, Country, Phone
ORDER BY SummeFreight DESC

--"Rechnungen" erstellen:
SELECT Orders.OrderID, CompanyName, Address, City, Country, Customers.CustomerID, OrderDate, 
SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Address, City, Country

--1. Mitarbeiter der die Bestellung bearbeitet hat hinzufügen (LastName)
SELECT Orders.OrderID, CompanyName, Customers.Address, Customers.PostalCode, Customers.City, Customers.Country, Customers.CustomerID,
Employees.LastName, OrderDate, 
CAST(SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Customers.Address, 
Customers.City, Customers.Country, Employees.LastName, Customers.PostalCode

--HAVING Filterklausel für Gruppen; funktioniert genau wie WHERE, kann aber Aggregate filtern
SELECT Orders.OrderID, CompanyName, Customers.Address, Customers.PostalCode, Customers.City, Customers.Country, Customers.CustomerID,
Employees.LastName, OrderDate, 
CAST(SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Customers.Address, 
Customers.City, Customers.Country, Employees.LastName, Customers.PostalCode
HAVING CAST(SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) > 1000


--WICHTIG: Having nur verwenden, wenn es mit WHERE nicht möglich ist! Also nur für Gruppierungen/Aggregate
SELECT Orders.OrderID, CompanyName, Customers.Address, Customers.PostalCode, Customers.City, Customers.Country, Customers.CustomerID,
Employees.LastName, OrderDate, 
CAST(SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Customers.Address, 
Customers.City, Customers.Country, Employees.LastName, Customers.PostalCode
HAVING Customers.Country = 'Germany'



--1. Wieviel Umsatz hat jeder Angestellte insgesamt generiert?
SELECT LastName,
CAST(SUM(([Order Details].UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) as RechnungsSumme
FROM Orders
--JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
--JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY LastName

SELECT Productname, od.unitprice, p.unitprice FROM [Order Details] as od
JOIN Products as p ON p.ProductID = od.ProductID


--2. Welches Produkt wurde am öftesten verkauft? Welches am wenigsten?
SELECT ProductName, SUM(Quantity) as StückzahlGesamt FROM Products as p
JOIN [Order Details] as od ON p.ProductID = od.ProductID
GROUP BY ProductName
ORDER BY StückzahlGesamt DESC
--am wenigsten: Mishi Kobe Niku; am meisten: Camembert Pierrot
SELECT ProductName, COUNT(od.ProductID) as StückzahlGesamt FROM Products as p
JOIN [Order Details] as od ON p.ProductID = od.ProductID
GROUP BY ProductName
ORDER BY StückzahlGesamt DESC

--3. Welcher Spediteur ist durchschnittlich der günstigste? (Bezogen auf Freight)
SELECT CompanyName, AVG(Freight) as Durchschnitt FROM Orders as o
JOIN Shippers as s ON o.ShipVia	= s.ShipperID
GROUP BY CompanyName
ORDER BY Durchschnitt

SELECT CompanyName, AVG(Freight) as Durchschnitt, SUM(freight)/Count(Freight) FROM Orders as o
JOIN Shippers as s ON o.ShipVia	= s.ShipperID
GROUP BY CompanyName
ORDER BY Durchschnitt


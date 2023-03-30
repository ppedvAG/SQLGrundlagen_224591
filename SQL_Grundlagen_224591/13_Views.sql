--VIEWS/Sichten = "Abgespeicherte Abfragen", d.h. die Ergebnistabelle einer Abfrage wird als Datenbankobjekt hinterlegt (Ordner Sichten unter Ordner Tabellen)
--Syntax: CREATE VIEW Viewname AS Abfrage

--Rechnungs"maske" als View/Sicht abspeichern:

CREATE VIEW vRechnungen AS
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

--Wichtig: Views nur verwenden wenn man tatsächlich alle Infos daraus braucht, da die ganze hinterlegte Abfrage ausgeführt wird!
--Wenn nur ein Bruchteil benötigt wird: besser direkt die Tabellen aufrufen!

SELECT DISTINCT CompanyName FROM vRechnungen

--Löschen oder ändern einer View mit ALTER oder DROP

DROP VIEW vRechnungen

ALTER VIEW vRechnungen
AS
SELECT Orders.OrderID, CompanyName as Firma, Customers.Address, Customers.PostalCode, Customers.City, Customers.Country, Customers.CustomerID,
Employees.LastName, OrderDate, 
CAST(SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as decimal(10,2)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Customers.Address, 
Customers.City, Customers.Country, Employees.LastName, Customers.PostalCode

SELECT * FROM vRechnungen
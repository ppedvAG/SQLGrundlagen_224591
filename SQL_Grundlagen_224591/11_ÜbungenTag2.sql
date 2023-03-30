--1. Aus wievielen verschiedenen Städten wurden Bestellungen unserer Kunden erstellt? (City(des Kunden))
SELECT DISTINCT City FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID

--2. Welcher Angestellte hat im August 1997 die meisten Bestellungen bearbeitet?
SELECT LastName, OrderID FROM Orders as o
JOIN Employees as e ON o.EmployeeID = e.EmployeeID
--WHERE OrderDate BETWEEN '19970801' AND '19970831'
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(MONTH, OrderDate) = 8
ORDER BY Lastname

--3. Wieviele Bestellpositionen haben einen Discount erhalten im Jahr ersten Quartal 1998?
SELECT * FROM Orders as o
JOIN [Order Details] as od ON o.OrderID = od.OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(QUARTER, OrderDate) = 1 AND Discount > 0

--4. Da Andrew Fuller der Chef ist, sollen alle Bestellungen die er bearbeitet hat einen Aufschlag von 10$ bekommen
--> Freight um 10 erhöhen
SELECT LastName, OrderID,
CASE 
	WHEN LastName = 'Fuller' THEN Freight + 10
	ELSE Freight
END as FreightNeu
FROM Orders as o
JOIN Employees as e ON o.EmployeeID = e.EmployeeID

--5. Wer hat wen als Vorgesetzten? (Lastname Angestellter, Lastname Vorgesetzter)
SELECT Mitarbeiter.EmployeeID, Mitarbeiter.LastName, Vorgesetzter.EmployeeID, Vorgesetzter.LastName 
FROM Employees as Mitarbeiter
JOIN Employees as Vorgesetzter ON Mitarbeiter.EmployeeID = Vorgesetzter.ReportsTo
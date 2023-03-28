--Übungen zu Tag 1 / Wiederholung:

--1. Firmenname, Adresse, Stadt und das Land aller Kunden aus Mexico und Argentinien

SELECT CompanyName, [Address], City, Country FROM Customers
WHERE Country IN ('Mexico', 'Argentina')

--2. Alle Kunden deren PostalCode mit 5, 8 oder 0 beginnt

SELECT * FROM Customers
WHERE PostalCode LIKE '[580]%'

--3. Alle Bestellungen die in Quartal 3 in 1997 geliefert wurden

SELECT * FROM Orders
WHERE ShippedDate BETWEEN '19970701' AND '19970930'

SELECT * FROM Orders
WHERE DATEPART(Year, ShippedDate) = 1997 AND DATEPART(Quarter, ShippedDate) = 3

--4. Alle Angestellten, deren Geburtsdatum noch innerhalb 15 Jahren nach Ende 2.WK war, Vor+Nachname 

SELECT FirstName + ' ' + LastName, BirthDate FROM Employees
WHERE DATEPART(YEAR, BirthDate) <= 1960

--5. Produkte aus der Kategorie Dairy: Stückpreis um 33% erhöhen

SELECT * FROM Categories

SELECT *, CAST(UnitPrice*1.33 as decimal(10,2)) as UnitPriceNeu FROM Products
WHERE CategoryID = 4

--6. In welchen Monaten ("Monatsname") wurden Bestellungen nach Deutschland via "SpeedyExpress" versandt?

SELECT * FROM Shippers

SELECT *, DATENAME(Month, ShippedDate) as Monat FROM Orders
WHERE ShipVia = 1 AND ShipCountry = 'Germany'
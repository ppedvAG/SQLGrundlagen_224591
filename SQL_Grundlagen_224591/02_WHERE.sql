--Filtern mit WHERE (syntaktisch nach FROM)

SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT Freight FROM Orders
WHERE Freight > 500

--alle Vergleichsoperatoren möglich; =, >, <, <=, >=, != (=ungleich)

SELECT Freight FROM Orders
WHERE Freight > 100 AND Freight < 500

SELECT * FROM Customers
WHERE Country != 'France'

--BETWEEN ist mit Randwerten (>= und <=)
SELECT Freight FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19970201'


--1. Alle Kunden aus Berlin
SELECT * FROM Customers
WHERE City = 'Berlin'

--2. Alle Bestellpositionen (order details) bei denen 
--mehr als 10 stück bestellt wurden
SELECT * FROM [Order Details]
WHERE Quantity > 10

--3. Alle Kunden die eine Fax-Nummer hinterlegt haben
SELECT * FROM Customers
WHERE Fax != 'NULL' 

SELECT * FROM Customers
WHERE Fax IS NOT NULL -- IS NULL

--4. Alle Kunden aus Deutschland, Spanien und Paris
SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain' OR City = 'Paris'

--WHERE Spalte IN (Wertt1, Wert2 usw) können mehrere ORs zusammengefasst werden
SELECT * FROM Customers
WHERE Country IN ('Germany', 'Spain') OR City = 'Paris'

--5. Alle Produkte (Produktnamen) aus der Kategorie "Beverages"
SELECT * FROM Products
WHERE CategoryID = 1
SELECT * FROM Categories

--Klammern setzen wenn nötig!
--AND ist "stärker bindent" als OR
SELECT * FROM Customers
WHERE City = 'Paris' AND (Country = 'France' OR Country = 'Germany')



--Arbeiten mit Strings


' Seidel'

= 'Seidel' LIKE 'S%'

--Entfernt Leerstellen (überall, links, rechts), aber nie "zwischen 2 wörtern"
TRIM, LTRIM, RTRIM

SELECT '             Hallo'

SELECT TRIM('             Hallo')


--Konkatieren, bzw. CONCAT
SELECT FirstName + ' ' + LastName FROM Employees
SELECT CONCAT(Firstname, ' ', LastName) FROM Employees

--Nur X Symbole ausgeben mit LEFT oder RIGHT

SELECT LEFT(CompanyName, 5) FROM Customers
SELECT RIGHT(CompanyName, 5) FROM Customers

--"Aus der Mitte" mit SUBSTRING

SELECT SUBSTRING(Phone, 5, 3), Phone FROM Customers
--"Starting Position" mit inbegriffen!

--Länge eines Strings (= Anzahl an symbolen) mit LEN
SELECT LEN(CompanyName) FROM Customers

--Einen String zu einem anderen "hinzufügen" mit STUFF
SELECT STUFF(Phone, 1, 6, 'XXX') FROM Customers

--Ersetzt einen fixen String mit etwas anderem, egal an welcher Stelle:
SELECT REPLACE(OrderID, '10', '') FROM Orders

SELECT LEFT(Phone, LEN(Phone) - 4) FROM Customers
SELECT STUFF(CompanyName, 3, LEN(Companyname)/2 ,'XXX') FROM Customers

--1. Phone von Customers, nur die letzten 4 Ziffern, alles davor soll X sein
SELECT Phone, LEN(Phone) as Länge, LEN(Phone) - 4 as SollWegLinks,
STUFF(Phone, 1, LEN(Phone) - 4 , 'XXXXX')
FROM customers

--2. Wert von allen Bestellpositionen berechnen (Order Details), 
--Quantity, Unitprice, Discount
SELECT orderID as Bestellnummer, ProductId, 
(Quantity*UnitPrice) * (1 - Discount) as SummePosition 
FROM [Order Details]


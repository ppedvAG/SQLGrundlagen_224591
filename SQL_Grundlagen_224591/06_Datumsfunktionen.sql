--Arbeiten mit Datum

--Gibt aktuelle Systemzeit aus:
SELECT getdate()

--Addieren/Subtrahieren eines Zeitintervalls von einem Datum
SELECT DATEADD(month, 1, '20230327')
SELECT DATEADD(month, 1, getdate())
SELECT DATEADD(year, -1, getdate())

--Differenz zwischen 2 Datum in Tagen/Wochen/Monaten usw.
SELECT DATEDIFF(dd, '19930224', getdate())

--Nur Teile aus einem Datum ziehen
SELECT DAY(OrderDate), MONTH(OrderDate), YEAR(OrderDate) FROM Orders

SELECT DATEPART(QUARTER, OrderDate) FROM Orders

SELECT DATENAME(MONTH, '19930224'), DATENAME(WEEKDAY, '19930224')

--1. Differenz in Tagen zwischen Shipped und RequiredDate (Orders),
--Hatten wir Lieferverzögerungen?

SELECT RequiredDate, ShippedDate, 
DATEDIFF(dd, ShippedDate, RequiredDate) as Lieferverzögerung
FROM Orders
WHERE DATEDIFF(dd, ShippedDate, RequiredDate) < 0
ORDER BY Lieferverzögerung

--Funktion: ISNULL(Wert, Ersatzwert), ersetzt NULL mit Ersatzwert
SELECT RequiredDate, ShippedDate, 
DATEDIFF(dd, ISNULL(ShippedDate, getdate()), RequiredDate) as Lieferverzögerung
FROM Orders
WHERE DATEDIFF(dd, ISNULL(ShippedDate, getdate()), RequiredDate) < 0
ORDER BY Lieferverzögerung

--1. Bestellpositionen wie vorher = netto, 
-- zusätzlich noch Spalte brutto und MwSt
SELECT *,
(Quantity*UnitPrice) * (1 - Discount) as Netto,
(Quantity*UnitPrice) * (1 - Discount)*1.19 as Brutto,
(Quantity*UnitPrice) * (1 - Discount)*0.19 as MwSt
FROM [Order Details]

--2. Alle Kunden-Ansprechpartner in dessen Titel irgendwas mit "Sales" vorkommt
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Sales%'

--3. Alle Produkte, die aktiv sind (Discontinued = 0), bei denen nichts mehr auf
--Lager ist
SELECT * FROM Products
WHERE Discontinued = 0 AND UnitsInStock <= 0

--4. Alle Produkte, die NICHT aktiv sind, aber noch Lagerbestand haben:
--Ausverkauf: reduziere deren UnitPrice um 50%!
SELECT ProductName, CAST(UnitPrice*0.5 as decimal(10,2)) as RabattPreis, 
UnitPrice/2 FROM Products
WHERE Discontinued = 1 AND UnitsInStock > 0


--Datentypen umwandeln mit CAST oder CONVERT

SELECT CAST(OrderDate as date) FROM Orders

--CONVERET optionales Argument "Style": Formatiert einen String um, bspw. Datum in DE dd.mm.yyyy
SELECT CONVERT(varchar(20), OrderDate, 104) FROM Orders


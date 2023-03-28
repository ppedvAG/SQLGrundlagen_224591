--CASE 
--wird im SELECT verwendet, also erstellt eine eigene Spalte
--Es k�nnen verschiedenste WHEN Bedingungen formuliert werden; wenn diese zutreffen, wird der Wert hinterlegt der nach THEN angegeben wird
--Nach allen WHEN Bedingungen kann optional noch ein ELSE formuliert werden, dass zutrifft, wenn keine WHEN Bedingung erf�llt wurde
--Ohne ELSE werden nicht abgedeckte F�lle mit NULL ausgef�llt

SELECT 
CustomerID, CompanyName, Country,
CASE
	WHEN Country = 'Germany' THEN 'Hans M�ller'
	WHEN Country = 'France' THEN 'Jaque Gusto'
	ELSE ContactName
END as ContactNameNeu
FROM Customers

--1. In Products den UnitPrice erh�hen abh�ngig der CategoryID
-- Dairy um 10%; Beverages um 50%; Grains/Cereals um -20%; Meat/Poultry durchg�ngig auf genau 100�

SELECT ProductName, UnitPrice, c.CategoryName,
CAST(CASE
	WHEN CategoryName = 'Dairy Products' THEN UnitPrice*1.1
	WHEN CategoryName = 'Beverages' THEN UnitPrice*1.5
	WHEN CategoryName = 'Grains/Cereals' THEN UnitPrice*0.8
	WHEN CategoryName = 'Meat/Poultry' THEN 100
	ELSE UnitPrice
END as decimal(10,2)) as UnitPriceNeu
FROM Products as p
JOIN Categories as c ON p.CategoryID = c.CategoryID


--2. "ABC" Analyse der Positionssummen in Order Details
--A = gr��er 8000; B = zwischen 1000 und 8000, und C = unter 1000

--Ergebnis: OrderID, ProductID, PositionsSumme, Kategorie(A/B/C)

SELECT OrderID, ProductID, (Quantity * UnitPrice) * (1 - Discount) as PosiSumme,
CASE 
	WHEN (Quantity * UnitPrice) * (1 - Discount) > 8000 THEN 'A'
	WHEN (Quantity * UnitPrice) * (1 - Discount) BETWEEN 1000 AND 8000 THEN 'B'
	ELSE 'C'
END as [ABC-Kategorie]
FROM [Order Details]
ORDER BY 4, 3 DESC

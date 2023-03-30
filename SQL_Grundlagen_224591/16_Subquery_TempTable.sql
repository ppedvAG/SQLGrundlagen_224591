--Unterabfrage/Subquery/Nested query:
--Eigenst�ndige SELECT Abfrage die in Klammern in einer anderen Anweisung "verschachtelt" ist
--Regel: M�ssen eigenst�ndig ausf�hrbar sein/funktionieren
--SQL Server l�st von "innen nach au�en" auf; d.h die innerste Abfrage wird zuerst fertig berechnet, dann die n�chste usw. bis zur �u�ersten

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)
--Mit dieser Subquery kann der Wert f�r AVG(Freight) "vorab" berechnet werden, sodass bereits ein Wert f�r den WHERE Filter existiert


--Funktionieren im SELECT, FROM und WHERE


SELECT MAX(RechnungsSumme) as Maximumu, MIN(Rechnungssumme) as Minimum FROM
(
SELECT Orders.OrderID, CompanyName, Address, City, Country, Customers.CustomerID, OrderDate, 
SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as RechnungsSumme
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Address, City, Country
) as t



--TempTables, tempor�re Tabellen:
--2 Arten: #lokal = "existiert" nur in DIESEM Skriptfenster; ##global = "existiert" auch in anderen Skriptfenstern
--Ergebnisse einer Abfrage k�nnen in eine tempor�re Tabelle "zwischengespeichert" werden; die temp.Tabelle kann dann im weiteren Skript referiert werden

SELECT Orders.OrderID, CompanyName, Address, City, Country, Customers.CustomerID, OrderDate, 
SUM((Products.UnitPrice * Quantity) * (1 - Discount)) as RechnungsSumme
INTO #t --Nach den SELECT Spalten, vor dem FROM ein INTO #tempTableName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Orders.OrderID, CompanyName, customers.CustomerID, OrderDate, Address, City, Country


SELECT MAX(RechnungsSumme) as Maximum, MIN(Rechnungssumme) as Minimum FROM #t

DROP TABLE #t

--Sind zus�tzlich auch sehr schnell, da die Ergebnisse einmal generiert/berechnet und dann gespeichert werden
--ABER: Dadurch unter Umst�nden nicht mehr aktuell wenn sich die Daten in der Zwischenzeit ver�ndert haben!
--F�r aktuelle Daten muss die TempTable neu generiert werden
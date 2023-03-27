-- SELECT leitet jede Abfrage ein

-- Zahlen/Strings/Mathematische Operationen möglich
SELECT 1

SELECT 'Hallo'

SELECT 5 * 3
SELECT 3 + (6/2) - 5

--SELECT * = "alles", also alle Spalten
--FROM gibt Tabelle an die aufgerufen werden soll
SELECT * FROM Customers

--USE "Datenbankname" gibt DB an in der abgefragt werden soll
USE Northwind

--Einzelne Spalten abfragen durch Spaltennamen angeben; mehrere Spalten mit "," trennen

SELECT CompanyName FROM Customers
SELECT CompanyName, City, Country FROM Customers
SELECT Country, CompanyName, City 
FROM Customers

--Kommentar einzeilig
/* Kommentar
über mehrere Zeilen
bis geschlossen */

--SQL ist nicht case sensitive, oder muss formatiert werden
SelEcT *
			FrOm
	 CusTOMerS

-- Konkatieren von Spalten mit CONCAT oder "+"

SELECT LastName, FirstName FROM Employees

SELECT FirstName + LastName FROM Employees 
SELECT 'Mitarbeiter ' + FirstName + ' ' + LastName FROM Employees 


--Spaltennamen "umbennen" mit Alias (as)
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees 
SELECT CompanyName as Firma FROM Customers

--Aliases funktionieren auch bei Tabellennamen
SELECT * FROM Customers as cus

--Mit DISTINCT werden Ergebnisse "gefiltert", nur einzigartige Ergebniszeilen
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, City FROM Customers

SELECT DISTINCT Country, City, CompanyName FROM Customers

--Werte von vorhandenen (numerischen) Spalten können "manipuliert"
SELECT * FROM Orders
SELECT Freight, Freight * 1.1 FROM Orders

--Ergebnisse sortieren mit ORDER BY
SELECT Freight FROM Orders
ORDER BY Freight

SELECT Freight FROM Orders
ORDER BY Freight DESC

--ORDER BY immer das letzte Statement in der Syntax!
--Standardmäßig aufsteigent (ASC = ascending), absteigend (DESC = descending)

SELECT Country, CompanyName FROM Customers
ORDER BY Country DESC, CompanyName

--SELECT TOP X gibt obersten X Zeilen aus
SELECT TOP 10 Freight FROM Orders 
ORDER BY Freight DESC

--TOP X Percent = obersten X Prozent
SELECT TOP 10 PERCENT * FROM Orders
ORDER BY Freight DESC


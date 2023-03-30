--Stammdaten verändern mit INSERT/UPDATE/DELETE

--UPDATE: Werte von Spalten in VORHANDENEN Datensätzen ändern

--INSERT: Neuen Datensatz in vorhandene Tabelle schreiben

--DELETE: Datensatz vollständig aus vorhandener Tabelle löschen

--CREATE TABLE: Erstellt neue Tabelle


SELECT * FROM Customers

UPDATE Customers
SET City = 'Hamburg'
WHERE CustomerID = 'ALFKI'

UPDATE Customers
SET Region = 
CASE
	WHEN Region IS NULL THEN 'NA'
	WHEN REGION = 'BC' THEN 'BA'
	ELSE Region
END

--Aufpassen! Immer WHERE Filter setzen, sonst wird GANZE Tabelle geupdatet

--Transactions:

BEGIN TRAN
SELECT @@TRANCOUNT
COMMIT ROLLBACK

UPDATE Customers
SET ContactName = 'upps'

SELECT * FROM Customers

--"Löschen" von Werten = SET = NULL
UPDATE Customers
SET PHONE = NULL
WHERE CustomerID = 'ALFKI'

--SELECT Phone FROM 
UPDATE Customers
SET Phone = NULL
WHERE CustomerID = 'ALFKI'


--DELETE löscht einen ganzen Datensatz

DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

SELECT * FROM Orders WHERE CustomerID = 'ALFKI'

SELECT * FROM [Order Details] WHERE ORDERid IN(
10643,
10692,
10702,
10835,
10952,
11011)

--INSERT fügt neuen Datensatz zu bestehender Tabelle hinzu

INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country)
VALUES ('PPEDV', 'ppedv AG', 'Marktler Str. 15b', 'Burghausen', 'Germany')

SELECT * FROM Customers WHERE CustomerID = 'PPEDV'

--Mehr als ein INSERT pro Statement: 
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country)
VALUES ('PPEDV', 'ppedv AG', 'Marktler Str. 15b', 'Burghausen', 'Germany'),
('EDEKA', 'usw....')

--Tabelle kopieren mit SELECT INTO neuer Tabellenname FROM alter Tabellenname

SELECT * INTO BackupCustomers FROM Customers
SELECT * FROM BackupCustomers
--Kopiert alle Datensätze und Einstellungen, AUßER Primär-/Fremdschlüssel



--CREATE TABLE erstellt neue Tabelle von grundauf:

CREATE TABLE Fuhrpark 
(
AutoID int unique NOT NULL,
Model varchar(30) NOT NULL,
Farbe varchar(20),
Kennzeichen varchar(10) NOT NULL
)

SELECT * FROM Fuhrpark

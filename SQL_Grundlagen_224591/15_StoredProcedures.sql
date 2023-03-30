--Stored Procedure, gespeicherte Prozedur; Werden als Datenbankobjekte unter "Programmierbarkeit - Gespeicherte Prozeduren" angelegt
--Syntax zum erstellen: CREATE PROCEDURE Procedurename (optional Variablen) AS Anweisung
--Ausführen mit EXEC Procedurename
--DROP und ALTER zum löschen/verändern

CREATE PROCEDURE spKundeNachLand @Land varchar(20)
AS
SELECT * FROM Customers
WHERE Country = @Land
--Proc die Customerstabelle nach eingegebenem Land filtert

EXEC spKundeNachLand Brazil


CREATE PROCEDURE spKundenRechnungen @CustomerID varchar(20)
AS
SELECT * FROM vRechnungen
WHERE CustomerID = @CustomerID
--Proc die unsere Rechnungsview nach eingegebener KundenID filtert

EXEC spKundenRechnungen ALFKI



--Prozeduren können sowohl SELECT, als auch UPDATE/INSERT/DELETE/CREATE usw. Anweisungen ausführen, quasi "alles"
--Komplexer Code kann runtergebrochen werden auf eine kurze EXEC Anweisung
--Sind für alle User sichtbar/nutzbar (sofern Rechte vorhanden)
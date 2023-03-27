-- "ungenaue" Suche/Filterung mit LIKE:
-- Schema mit sogenannten "Wildcards"

SELECT * FROM Customers
WHERE CompanyName LIKE 'A%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%M%'

-- '%' = unendlich Symbole, egal welche

SELECT * FROM Customers
WHERE CompanyName LIKE '_A%'

SELECT * FROM Customers
WHERE CompanyName LIKE '____A%'

-- '_' = EIN Symbol, egal welches

SELECT * FROM Customers
WHERE CompanyName LIKE '[abc]%'

-- '[xyz]' = alle in den Klammern ist zul�ssig

SELECT * FROM Customers
WHERE Phone LIKE '089-%'

SELECT * FROM Customers
WHERE CompanyName LIKE '[^abc]%'

-- '[^xyz]' = alles zul�ssig AU�ER das in den Klammern 

SELECT * FROM Customers
WHERE Phone LIKE '[0-5]%'

-- '[0-5]' = alles zul�ssig in der "Reichweite" in der Klammer

SELECT * FROM Customers
WHERE LastName LIKE 'M[yea][iy]er%'


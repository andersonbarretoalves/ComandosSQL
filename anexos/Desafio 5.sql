CREATE TABLE #SalesOrders (
    CustomerID INT,
    SalesOrderID INT,
    ProductType NVARCHAR(50),
    ProductLine NVARCHAR(50),
    ProductID INT
);

---- 

INSERT INTO #SalesOrders (CustomerID, SalesOrderID, ProductType, ProductLine, ProductID)
SELECT soh.CustomerID, soh.SalesOrderID, pc.name, pr.ProductLine, sod.ProductID
FROM Sales.SalesOrderHeader soh, Sales.SalesOrderDetail sod, Production.Product pr, Production.ProductSubcategory ps, Production.ProductCategory pc
WHERE soh.SalesOrderID = sod.SalesOrderID 
AND pr.ProductID = sod.ProductID 
AND ps.ProductCategoryID = pc.ProductCategoryID 
AND ps.ProductSubcategoryID = pr.ProductSubcategoryID

-----

Select *
from #SalesOrders

----


-- Cálculo da porcentagem de pedidos de venda com pelo menos uma bicicleta e um item de acessório
SELECT 
    'Porcentagem com bicicleta e acessório' AS Description,
    (COUNT(DISTINCT soh.SalesOrderID) * 100.0) / (SELECT COUNT(DISTINCT SalesOrderID) FROM Sales.SalesOrderHeader) AS Percentage
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
WHERE 
    p.ProductLine = 'R' -- Bicicletas
    AND p.ProductSubcategoryID IN (SELECT ProductSubcategoryID FROM Production.ProductSubcategory WHERE ProductCategoryID = 2) -- Acessórios
    AND EXISTS (SELECT 1 FROM Sales.SalesOrderDetail sod2 WHERE sod2.SalesOrderID = soh.SalesOrderID 
	AND sod2.ProductID IN (SELECT ProductID FROM Production.Product WHERE ProductLine = 'S')); -- Pelo menos um item de vestuário


-- Cálculo da porcentagem de pedidos de venda com pelo menos uma bicicleta e pelo menos dois produtos de vestuário diferentes
SELECT 
    'Porcentagem com bicicleta e 2 vestuários diferentes' AS Description,
    (COUNT(DISTINCT soh.SalesOrderID) * 100.0) / (SELECT COUNT(DISTINCT SalesOrderID) FROM Sales.SalesOrderHeader) AS Percentage
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
WHERE 
    p.ProductLine = 'R' -- Bicicletas
    AND EXISTS (SELECT 1 FROM Sales.SalesOrderDetail sod2 WHERE sod2.SalesOrderID = soh.SalesOrderID 
	AND sod2.ProductID IN (SELECT ProductID FROM Production.Product WHERE ProductLine = 'S' GROUP BY ProductID HAVING COUNT(DISTINCT ProductSubcategoryID) >= 2)); -- Pelo menos dois produtos de vestuário diferentes

-----

-- Contagem de pedidos de venda por tipo de produto
SELECT 
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'R' THEN soh.SalesOrderID END) AS Bicicletas,
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'S' THEN soh.SalesOrderID END) AS Vestuario,
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'T' THEN soh.SalesOrderID END) AS Acessorios,
	COUNT(DISTINCT CASE WHEN p.ProductLine = 'M' THEN soh.SalesOrderID END) AS Componentes,
	COUNT(DISTINCT soh.SalesOrderID) AS Pedidos
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID

-- Contagem de clientes por linha de produto
SELECT
	COUNT(DISTINCT CASE WHEN p.ProductLine = 'M' THEN soh.CustomerID END) AS M,
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'R' THEN soh.CustomerID END) AS R,
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'S' THEN soh.CustomerID END) AS S,
    COUNT(DISTINCT CASE WHEN p.ProductLine = 'T' THEN soh.CustomerID END) AS T,
	COUNT(DISTINCT soh.CustomerID) AS Clientes
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
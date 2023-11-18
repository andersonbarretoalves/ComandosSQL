
SELECT *
FROM Sales.SalesTerritoryHistory

SELECT *
FROM SALES.SalesOrderHeader

SELECT *
FROM Person.Person

SELECT *
FROM Sales.SalesTerritory

-----------------------------------------------

--BusinessEntityID
--LastName
--nome do territorio
-- Valor das vendas de 2011
--Sales.SalesTerritory name

------------------------------------------------

SELECT 
    sth.BusinessEntityID, p.FirstName + ' ' + p.LastName Vendedor,
    st.Name Territorio,
    COALESCE(SUM(soh.TotalDue), 0) Receita
FROM 
    Sales.SalesPerson sp
JOIN 
    Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
LEFT JOIN 
    Sales.SalesTerritoryHistory sth ON sp.BusinessEntityID = sth.BusinessEntityID
LEFT JOIN 
    Sales.SalesTerritory st ON sth.TerritoryID = st.TerritoryID
LEFT JOIN 
    Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
                              AND YEAR(soh.OrderDate) = 2011
GROUP BY 
    p.FirstName, p.LastName, st.Name, sth.BusinessEntityID
HAVING 
    st.Name IN ('Northwest', 'Southwest', 'Canada')
ORDER BY 
    st.Name, Receita DESC;


--------------------------------------------------------

SELECT 
    sth.BusinessEntityID, p.FirstName + ' ' + p.LastName AS Vendedor, -- Concatenado o primeiro nome com o ultimo
    st.Name AS Territorio,
    COALESCE(SUM(soh.TotalDue), 0) AS Receita -- Realizado a soma do "TotalDue" para cada vendedor e garantindo que caso não haja venda, retorne o valor "0".
FROM 
    Sales.SalesPerson sp
JOIN 
    Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID -- Relacionando as tabelas
LEFT JOIN 
    Sales.SalesTerritoryHistory sth ON sp.BusinessEntityID = sth.BusinessEntityID
LEFT JOIN 
    Sales.SalesTerritory st ON sth.TerritoryID = st.TerritoryID -- O "Left join" Garante que os vendedores estejam na lista, mesmo que não haja venda.
LEFT JOIN 
    Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
                              AND soh.OrderDate >= sth.StartDate --Garante que a data do pedido seja posterior ou igual à data de início do território.
                              AND (soh.OrderDate < sth.EndDate OR sth.EndDate IS NULL) 
							  --garante que consideremos apenas territórios que não possuem uma data de término (EndDate é NULL) ou onde a data do pedido seja anterior à data de término.
                              AND YEAR(soh.OrderDate) = 2011 -- Filtro por ano
GROUP BY 
    p.FirstName, p.LastName, st.Name, sth.BusinessEntityID
HAVING 
    st.Name IN ('Northwest', 'Southwest', 'Canada') -- Filtro de territorio
ORDER BY 
    st.Name, Receita DESC;

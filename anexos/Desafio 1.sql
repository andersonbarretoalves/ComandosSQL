SELECT *
FROM  HumanResources.EmployeePayHistory

SELECT *
FROM HumanResources.Employee

---Filtro do flag
---ultimo salario

SELECT PE.BusinessEntityID, FirstName, LastName, JobTitle,
(EPH.Rate * 50) AS Bonus -- Colunas selecionadas com o Bonos Solicitado
FROM HumanResources.Employee EP
INNER JOIN Person.Person PE ON EP.BusinessEntityID = PE.BusinessEntityID --Junção das tabelas EP e PE.
INNER JOIN (
        SELECT 
            BusinessEntityID,
            MAX(RateChangeDate) LatestRateChangeDate -- Junção com uma Subconsulta para encontrar o Salário mais recente
        FROM 
            HumanResources.EmployeePayHistory
        GROUP BY 
            BusinessEntityID
		   ) latestRate ON ep.BusinessEntityID = latestRate.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory EPH ON EP.BusinessEntityID = EPH.BusinessEntityID AND latestRate.LatestRateChangeDate = eph.RateChangeDate 
--Junção das Tabelas EP e EPH e latestRate como Chave de junção paa combinar o salario.
WHERE ep.SalariedFlag = 1 -- Filtro para selecionar os Assalariados

---

SELECT 
    emp.BusinessEntityID,
    per.FirstName,
    per.LastName,
    emp.JobTitle,
    eph.Rate * 50 AS Bonus
FROM 
    HumanResources.Employee AS emp
JOIN 
    Person.Person AS per ON emp.BusinessEntityID = per.BusinessEntityID
JOIN 
    (
        SELECT 
            BusinessEntityID,
            MAX(RateChangeDate) AS LatestRateChangeDate
        FROM 
            HumanResources.EmployeePayHistory
        GROUP BY 
            BusinessEntityID
    ) AS latestRate ON emp.BusinessEntityID = latestRate.BusinessEntityID
JOIN
    HumanResources.EmployeePayHistory AS eph ON emp.BusinessEntityID = eph.BusinessEntityID AND latestRate.LatestRateChangeDate = eph.RateChangeDate
WHERE 
    emp.SalariedFlag = 1;


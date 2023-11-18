--AGRUPAR POR NOME E INFLUENCIA
--CORRIGIR O RELACIONAMENTO

SELECT
    SR.Name AS ReasonName, -- Nome do Motivo da tabela SR.
    CASE
        WHEN ReasonCount = 1 THEN 'Motivo Exclusivo' --CASE usado para criar a coluna "ReasonInfluence" onde é categorizado de acordo com 1 ou mais motivos.
        ELSE 'Motivo Contribuinte'
    END AS ReasonInfluence,
    COUNT(SOHSR.SalesOrderID) AS SalesOrderCount -- 
FROM (
    SELECT
        SOH.SalesOrderID,
        COUNT(SOHSR.SalesOrderID) AS ReasonCount
    FROM
        Sales.SalesOrderHeader SOH
    LEFT JOIN
        Sales.SalesOrderHeaderSalesReason SOHSR ON SOH.SalesOrderID = SOHSR.SalesOrderID
    GROUP BY
        SOH.SalesOrderID
) AS OrderReasons
LEFT JOIN Sales.SalesOrderHeaderSalesReason SOHSR ON OrderReasons.SalesOrderID = SOHSR.SalesOrderID
JOIN Sales.SalesReason SR ON SOHSR.SalesReasonID = SR.SalesReasonID
GROUP BY
    SR.Name,
    ReasonCount;


SELECT
    ReasonName,
    CASE
        WHEN ReasonCount = 1 THEN 'Motivo Exclusivo'
        ELSE 'Motivo Contribuinte'
    END AS ReasonInfluence,
    COUNT(SOHSR.SalesOrderID) AS SalesOrderCount
FROM (
    SELECT
        SOH.SalesOrderID,
        COUNT(SOHSR.SalesOrderID) AS ReasonCount,
        STRING_AGG(SR.Name, ', ') AS ReasonName --Usado para concatenar os Motivos contribuintes
    FROM
        Sales.SalesOrderHeader SOH
    LEFT JOIN
        Sales.SalesOrderHeaderSalesReason SOHSR ON SOH.SalesOrderID = SOHSR.SalesOrderID
    LEFT JOIN
        Sales.SalesReason SR ON SOHSR.SalesReasonID = SR.SalesReasonID
    GROUP BY
        SOH.SalesOrderID
) AS OrderReasons
LEFT JOIN Sales.SalesOrderHeaderSalesReason SOHSR ON OrderReasons.SalesOrderID = SOHSR.SalesOrderID
GROUP BY
    ReasonName,
    ReasonCount;



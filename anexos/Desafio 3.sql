CREATE VIEW [ProductInventoryUpdates]
AS
SELECT
    LocationID,
    COUNT(DISTINCT ProductID) AS NumberOfDistinctProducts,
    SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory
GROUP BY LocationID
WITH ROLLUP;

SELECT * 
FROM ProductInventoryUpdates

SELECT *
FROM ProductInventoryUpdates
WHERE LocationID = 1


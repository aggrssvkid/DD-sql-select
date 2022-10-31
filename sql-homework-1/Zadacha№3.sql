SELECT TOP(10) City, COUNT(BusinessEntityID) as priority
FROM Sales.vIndividualCustomer
WHERE City NOT IN (SELECT City FROM Sales.vStoreWithAddresses)
GROUP BY City
ORDER BY Priority desc
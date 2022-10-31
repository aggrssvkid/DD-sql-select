select FirstName, LastName, tmp.Name, qty
from 
(SELECT PersonID, Product.ProductID, Name,  SUM(OrderQty) AS qty
FROM Sales.SalesOrderDetail
JOIN Production.Product
ON Product.ProductID = SalesOrderDetail.ProductID
JOIN Sales.SalesOrderHeader
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN Sales.Customer
ON Customer.CustomerID = SalesOrderHeader.CustomerID
GROUP BY PersonID, Product.ProductID, Product.Name) as tmp

JOIN Person.Person
ON tmp.PersonID = Person.Person.BusinessEntityID
WHERE qty > 15
ORDER BY qty desc, LastName asc, FirstName asc
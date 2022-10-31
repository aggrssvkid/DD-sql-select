select order_date, LastName, FirstName, CONCAT(Product.Name, ' quantity: ', SalesOrderDetail.OrderQty, ' piece') as order_name
from
(SELECT MIN(OrderDate) AS order_date, BusinessEntityID
		FROM Sales.SalesOrderHeader
		JOIN Person.Person
		ON SalesOrderHeader.CustomerID = Person.BusinessEntityID
		GROUP BY BusinessEntityID) as first_order

JOIN Person.Person ON first_order.BusinessEntityID = Person.BusinessEntityID
JOIN Sales.SalesOrderHeader 
ON first_order.BusinessEntityID = SalesOrderHeader.CustomerID
AND first_order.order_date = SalesOrderHeader.OrderDate
JOIN Sales.SalesOrderDetail 
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN Production.Product ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY order_date, LastName, FirstName, product.Name,  SalesOrderDetail.OrderQty
ORDER BY order_date desc
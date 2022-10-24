select count(product_name) as counter,  product_name, full_name
from
/*¬о втором внутреннем запросе € дл€ удобства объеденил им€ и фамилию челика в один столбец*/
(select CONCAT(tmp.last_name, ' ', tmp.first_name) as full_name, tmp.product_name
from
/*¬ первом внутреннем запросе € соеденил Person.Person с Production.Product, дабы затем выделить нужные мне колонки*/
(select Person.Person.LastName AS last_name, Person.Person.FirstName AS first_name, Production.Product.Name as product_name
from Production.Product
join Sales.SalesOrderDetail ON Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
Join Sales.SalesOrderHeader ON Sales.SalesOrderDetail.SalesOrderID = Sales.SalesOrderHeader.SalesOrderID
join  Sales.PersonCreditCard ON Sales.SalesOrderHeader.CreditCardID = Sales.PersonCreditCard.CreditCardID
join Person.Person ON Sales.PersonCreditCard.BusinessEntityID = Person.Person.BusinessEntityID)  as tmp) as conc_tmp
/*¬о внешнем запросе € попыталс€ сгруппировать данные как мне надо, чтобы посчитать количество продуктов, приобретенных одним
челиком, но вышло что-то не то, ни у кого нет более 15 покупок одного и того же товара*/
group by product_name, full_name
order by counter desc, full_name asc

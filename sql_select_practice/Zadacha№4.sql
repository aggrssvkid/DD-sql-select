select count(product_name) as counter,  product_name, full_name
from
/*�� ������ ���������� ������� � ��� �������� ��������� ��� � ������� ������ � ���� �������*/
(select CONCAT(tmp.last_name, ' ', tmp.first_name) as full_name, tmp.product_name
from
/*� ������ ���������� ������� � �������� Person.Person � Production.Product, ���� ����� �������� ������ ��� �������*/
(select Person.Person.LastName AS last_name, Person.Person.FirstName AS first_name, Production.Product.Name as product_name
from Production.Product
join Sales.SalesOrderDetail ON Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
Join Sales.SalesOrderHeader ON Sales.SalesOrderDetail.SalesOrderID = Sales.SalesOrderHeader.SalesOrderID
join  Sales.PersonCreditCard ON Sales.SalesOrderHeader.CreditCardID = Sales.PersonCreditCard.CreditCardID
join Person.Person ON Sales.PersonCreditCard.BusinessEntityID = Person.Person.BusinessEntityID)  as tmp) as conc_tmp
/*�� ������� ������� � ��������� ������������� ������ ��� ��� ����, ����� ��������� ���������� ���������, ������������� �����
�������, �� ����� ���-�� �� ��, �� � ���� ��� ����� 15 ������� ������ � ���� �� ������*/
group by product_name, full_name
order by counter desc, full_name asc

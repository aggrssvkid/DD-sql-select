/*������ ����� ��������� ����������� � ������ �������.
	�����, ����������� �� � ������� �������, �� "TerritoryID".
	� ������� ��� 10 ��������� �� ���-�� �����������
*/

select Top(10) Name, num_of_customers
from
(select TerritoryID, count(CustomerID) AS num_of_customers
from Sales.Customer
group by TerritoryID) AS tmp
JOIN Person.StateProvince ON tmp.TerritoryID = Person.StateProvince.TerritoryID
order by num_of_customers desc
/*�� �����, ��� ��������� ������ �� ������� ��������*/

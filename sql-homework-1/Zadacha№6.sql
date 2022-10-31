select CONCAT(LastName, ' ', SUBSTRING(FirstName, 1, 1), '.', SUBSTRING(MiddleName, 1, 1), '.') as chief, HireDate as chiefHireDate, BirthDate as chiefBirthDate,
CONCAT(lName, ' ', SUBSTRING(fname, 1, 1), '.', SUBSTRING(mName, 1, 1), '.') as employee, hDate as employeeHireDate, bDate as employeeBirthDate
from
(/* �������� ������ ������ �� ���� ����������*/
select HumanResources.Employee.BusinessEntityID as employeeID, Person.LastName as lName, Person.FirstName as fName, Person.MiddleName as mName,
 Employee.HireDate as hDate, Employee.BirthDate as bDate, Department.GroupName as departmentGroup,
 Department.Name as departmentName, Employee.OrganizationLevel as orgLvl

from HumanResources.Employee
Join Person.Person on Employee.BusinessEntityID = person.BusinessEntityID
Join HumanResources.EmployeeDepartmentHistory on EmployeeDepartmentHistory.BusinessEntityID = Employee.BusinessEntityID
Join HumanResources.Department on Department.DepartmentID = EmployeeDepartmentHistory.DepartmentID
)
/*��������� ����������� � ������������ � ���� �������*/
 as all_employee Join
(/*������� ����������� � �����������, �� ��������,��������� �������� � ��� �� ������, ��
 � ���� ����� ������ ������� ����������� � �������� ���������� ����, ���� ������� ����������� ���������*/

select Department.GroupName as departmentGroup, Department.Name as departmentName, Min(OrganizationLevel) as lvl, Min(Employee.BusinessEntityID) as nachalnikID
from HumanResources.Employee
Join Person.Person on Employee.BusinessEntityID = person.BusinessEntityID
Join HumanResources.EmployeeDepartmentHistory on EmployeeDepartmentHistory.BusinessEntityID = Employee.BusinessEntityID
Join HumanResources.Department on Department.DepartmentID = EmployeeDepartmentHistory.DepartmentID
group by Department.GroupName, Department.Name
 ) as nachalniki on all_employee.departmentGroup = nachalniki.departmentGroup AND all_employee.departmentName = nachalniki.departmentName AND all_employee.orgLvl >= nachalniki.lvl
 /*������� ������ ����������� �� �� ���� � ��������� �� � ����� ��������*/
 join Person.Person on Person.BusinessEntityID = nachalnikID
 join HumanResources.Employee on Employee.BusinessEntityID = nachalnikID
 /*������� ���� ����������� ��������������� ������� ������
	hDate - ���� ������ �� ������ ����������, HireDate - ���� ������ ����������,
	bDate - ���� �������� ���������� , BirthDate - ���� �������� ����������
	� ��������� �� ������ � �����������
 */
 where hDate < HireDate AND bDate < BirthDate
 order by all_employee.orgLvl, LastName, lName
set statistics io on;
set statistics time on;

/*
����������� �� �������, �� �������� ����� ������� ������
� �� ��������, �� ������� ����� ����������.
*/

create index idx_Marketing_double_name on Marketing.Prospect (LastName, FirstName);
create index idx_Marketing_double_name on Marketing.Salesperson (LastName, FirstName);

SELECT p.LastName, p.FirstName 
FROM Marketing.Prospect AS p
INNER JOIN Marketing.Salesperson AS sp
ON p.LastName = sp.LastName
ORDER BY p.LastName, p.FirstName;

SELECT * 
FROM Marketing.Prospect AS p
WHERE p.LastName = 'Smith';

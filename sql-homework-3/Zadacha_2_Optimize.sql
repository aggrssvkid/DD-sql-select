set statistics io on;
set statistics time on;

/*
������� ������� �� �������� "order by".
���, ����� ��������  StateCode ��� �� ��������, ����� ��������� ����� ��������� ������.
*/

create index idx_Marketing_PostalCOde on Marketing.PostalCode (StateCode, PostalCode);

SELECT PostalCode, Country
FROM Marketing.PostalCode 
WHERE StateCode = 'KY'
ORDER BY StateCode, PostalCode;
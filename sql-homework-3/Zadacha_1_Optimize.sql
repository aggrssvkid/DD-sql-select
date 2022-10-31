DECLARE @StartTime datetime2 = '2010-08-30 16:27';

set statistics io on;
set statistics time on;

create index idx_WebLog on Marketing.Weblog (SessionStart, ServerID) include (UserName);
/*
������� ������ �� ��������, �� ������� ���� "order by" (� ����� �� �������),
��� ��� ������ �������� ������ ���������� �������������.
��� ��, ��������� �������� "UserName" � ���������, ���� �� ������ �� ��
Primary key
*/

SELECT TOP(5000) wl.SessionStart, wl.ServerID, wl.UserName
FROM Marketing.WebLog AS wl
WHERE wl.SessionStart >= @StartTime
order by wl.SessionStart, wl.ServerID
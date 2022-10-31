select tmp.year, tmp.month,  sum(tmp.daysum) as end_sum
from

(select DueDate, DATEPART(YEAR, Sales.SalesOrderHeader.DueDate) As year,
DATEPART(MONTH, Sales.SalesOrderHeader.DueDate) as month, sum(TotalDue) AS daysum
from Sales.SalesOrderHeader
group by DueDate) AS tmp

group by tmp.year, tmp.month
order by tmp.year, tmp.month
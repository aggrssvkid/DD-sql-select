/* Мое почтение! Возможно, я сделал не то, что надо, но покрайней мере я чему-то научился!*/
select tmp.year, tmp.month,  sum(tmp.daysum) as end_sum
from
/* Для начала, мне захотелось просто выделить дату и сумму, соответствующую этой дате.
	Удачно оказалось, что внутрення таблица сразу может пойти на вход во внешний "from".
	Плюс, сразу можно выделить год и месяц, соответствующей дате, с помощью "DATEPART"
*/
(select DueDate, DATEPART(YEAR, Sales.SalesOrderHeader.DueDate) As year, DATEPART(MONTH, Sales.SalesOrderHeader.DueDate) as month, sum(TotalDue) AS daysum
from Sales.SalesOrderHeader
group by DueDate) AS tmp
/* После группируем строки по годам, а в годах по месяцам (насколько я понял так можно)
	и суммируем по сгруппированным столбикам. Вроде бы что-то путное вышло!
*/
group by tmp.year, tmp.month
order by tmp.year, tmp.month
set statistics io on;
set statistics time on;

/*
Создаем индексы по столбцам "order by".
Еще, лучше заменить  StateCode тип на числовой, чтобы уменьшить время сравнения данных.
*/

create index idx_Marketing_PostalCOde on Marketing.PostalCode (StateCode, PostalCode);

SELECT PostalCode, Country
FROM Marketing.PostalCode 
WHERE StateCode = 'KY'
ORDER BY StateCode, PostalCode;
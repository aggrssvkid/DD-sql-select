set statistics io on;
set statistics time on;

/*
ќчень низка€ селективность у столбцов, по которым происходит соединение и группировка,
поэтому € бы оставил тут все без изменений
*/

/*Можно попробовать создать покрывающие индексы. Прибавки к производительности нет,
но план выполнения меняется и компьютер начинает использовать эти индексы!

Create index idx_Marketing_Product on Marketing.Product (SubcategoryID)
include (ProductModelId)
Create index idx_Marketing_Subcategory on Marketing.Subcategory (CategoryID)
include (SubcategoryName)

*/
SELECT
	c.CategoryName,
	sc.SubcategoryName,
	pm.ProductModel,
	COUNT(p.ProductID) AS ModelCount
FROM Marketing.ProductModel pm
	JOIN Marketing.Product p
		ON p.ProductModelID = pm.ProductModelID
	JOIN Marketing.Subcategory sc
		ON sc.SubcategoryID = p.SubcategoryID
	JOIN Marketing.Category c
		ON c.CategoryID = sc.CategoryID
GROUP BY c.CategoryName,
	sc.SubcategoryName,
	pm.ProductModel
HAVING COUNT(p.ProductID) > 1
set statistics io on;
set statistics time on;

/*
����� ������ ������������� � ��������, �� ������� ���������� ���������� � �����������,
������� � �� ������� ��� ��� ��� ���������
*/

/*����� ����������� ������� ����������� �������. �������� � ������������������ ���,
�� ���� ���������� �������� � ��������� �������� ������������ ��� �������!

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
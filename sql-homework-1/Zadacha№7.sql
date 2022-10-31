CREATE PROCEDURE CountOfSingleMenInInterval3(
	@dateFrom date,
	@dateTo date,
	@count int OUTPUT
	)
AS
BEGIN
	SELECT HumanResources.Employee.BusinessEntityID, FirstName, MiddleName, LastName, BirthDate, NationalIDNumber, OrganizationNode, MaritalStatus, Gender, HireDate
	FROM HumanResources.Employee, Person.Person
	WHERE (Gender='M' AND MaritalStatus='S' AND @dateFrom < BirthDate AND BirthDate < @dateTo) AND HumanResources.Employee.BusinessEntityID = Person.BusinessEntityID;
		
	SELECT @count = COUNT(BusinessEntityID)
	FROM HumanResources.Employee
	WHERE (Gender='M' AND MaritalStatus='S' AND @dateFrom < BirthDate AND BirthDate < @dateTo); 
END;

CREATE TABLE #TmpResult(
	BusinessEntityID int,
	FirstName nvarchar(50),
	MiddleName nvarchar(50),
	LastName nvarchar(50),
	BirthDate date,
	NationalIDNumber nvarchar(50),
	OrganizationNode hierarchyid,
	MaritalStatus nchar(1),
	Gender nchar(1),
	HireDate date
);

declare @df date = '1970-01-01';
declare @dt date = '1980-01-01';
declare @result int;
INSERT INTO #TmpResult
EXEC CountOfSingleMenInInterval @df, @dt, @result output
SELECT @result as CountedBachelors
SELECT * FROM #TmpResult

DROP PROCEDURE CountOfSingleMenInInterval
DROP TABLE #TmpResult
CREATE OR ALTER FUNCTION GetAverageSalary() RETURNS MONEY
AS
BEGIN
	RETURN (SELECT AVG(Salary) FROM Employee);
END;
GO

SELECT dbo.GetAverageSalary();

GO

CREATE OR ALTER FUNCTION GetAverageSalaryByDepartment(@DepartmentId int)
RETURNS Money
AS
BEGIN
	RETURN (SELECT AVG(Salary)
	FROM Employee
	WHERE DepartmentId = @DepartmentId);
END;

GO
SELECT dbo.GetAverageSalaryByDepartment(1);
CREATE OR ALTER PROCEDURE InsertEmployee
	@Name nvarchar(100),
	@ChiefName nvarchar(100),
	@Salary money,
	@DepartmentName nvarchar(100),
	@EmployeeId int = NULL OUTPUT 
AS
BEGIN
	DECLARE @DepartmentId int = (SELECT Id FROM Department WHERE Name = @DepartmentName);
	DECLARE @ChiefId int = (SELECT Id FROM Employee WHERE Name = @ChiefName);

	IF (@ChiefName IS NOT NULL AND @ChiefId IS NULL)
	BEGIN
		SELECT 'ERROR CASE SCENARIO';
		RETURN;
	END;

	INSERT INTO Employee (ChiefId, Name, Salary, DepartmentId) VALUES (@ChiefId, @Name, @Salary, @DepartmentId);
	SET @EmployeeId = SCOPE_IDENTITY();

	SELECT * FROM Employee WHERE Id = SCOPE_IDENTITY();
END;

GO

-- SELECT TOP 10 * FROM Employee WHERE Name = 'Charles';
DELETE FROM Employee WHERE Name = 'Charles';
DECLARE @EmployeeId int = 5;
EXEC InsertEmployee 'Charles', 'Bob', 1100, 'Administration', @EmployeeId OUTPUT;
EXEC InsertEmployee
	@Name = 'Charles', @ChiefName = 'Bob', @Salary = 1100, @DepartmentName = 'Administration', @EmployeeId = @EmployeeId OUTPUT;
SELECT @EmployeeId, 'Employee';

-- Demonstrate IF 
-- EXEC InsertEmployee 'Charles', 'Bob1', 1100, 'Administration';

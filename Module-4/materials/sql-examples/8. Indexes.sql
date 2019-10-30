USE [HumanResources]
GO

SET STATISTICS IO ON;

DROP INDEX IDX_Employee_DepartmentId ON Employee;
GO

SELECT Id FROM Department WHERE Name = 'Administration';
SELECT * FROM Employee WHERE DepartmentId = 1;

-- DROP INDEX IDX_Employee_DepartmentId ON Employee
CREATE INDEX IDX_Employee_DepartmentId ON Employee(DepartmentId) INCLUDE (Name);
GO

SELECT Id FROM Employee WHERE DepartmentId = 1 OPTION(RECOMPILE);
SELECT Name FROM Employee WHERE DepartmentId = 1;
SELECT Salary FROM Employee WHERE DepartmentId = 1;
SELECT * FROM Employee WHERE DepartmentId = 1;
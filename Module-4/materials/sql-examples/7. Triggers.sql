ALTER TABLE Employee ADD CreatedOn DATETIME2 DEFAULT(GETUTCDATE()) NOT NULL;
ALTER TABLE Employee ADD ModifiedOn DATETIME2 DEFAULT(GETUTCDATE()) NOT NULL;

GO

CREATE OR ALTER TRIGGER Employee_Modified
    ON Employee AFTER UPDATE
AS
BEGIN
    UPDATE Employee
    SET ModifiedOn = GETUTCDATE(), CreatedOn = d.CreatedOn
    FROM Employee e
	INNER JOIN deleted d ON e.Id = d.Id; -- inserted
END;

SELECT TOP 100 * FROM Employee;
UPDATE Employee SET Salary = 1543 WHERE id in (1,2);
UPDATE Employee SET CreatedOn = GETUTCDATE() WHERE id IN (1,2);
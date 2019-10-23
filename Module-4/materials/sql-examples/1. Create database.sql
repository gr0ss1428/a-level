-- переключиться на системную базу данных, которая точно существует на сервере и которую нельзя уничтожить
USE master
GO

-- Удалить базу данных если она существует
DROP DATABASE IF EXISTS HumanResources
-- Если база данных существует и ее не удается удалить потому что она используется на данный момент выполните следующую команду
-- ALTER DATABASE HumanResources SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- не забудьте переключиться на master самой первой командой

-- создать новую базу данных
CREATE DATABASE HumanResources
GO

-- переключиться на вновь созданную базу данных
USE HumanResources
GO

-- создать таблицу Department
CREATE TABLE Department
(
	Id int IDENTITY(1,1) PRIMARY KEY, -- числовое поле, автоинкремент каждой новой записи на 1 начиная с 1
	Name nvarchar(100) NOT NULL -- юникод строка переменной длины максимум на 100 символов
);
-- добавить ограничение уникальности на поле Name
ALTER TABLE Department ADD UNIQUE (Name);

-- создать таблицу Employee
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[ChiefId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Salary] [money] NOT NULL DEFAULT(0), -- денежное поле
	[DepartmentId] [int] NOT NULL
);

-- добавить ограничение уникальности на поле Name
ALTER TABLE Employee ADD UNIQUE (Name);

-- Изменить таблицу Employee путем добавления внешнего ключа на саму себя
ALTER TABLE [dbo].[Employee] WITH CHECK ADD FOREIGN KEY([ChiefId]) REFERENCES [dbo].[Employee] ([Id]);
-- Изменить таблицу Employee путем добавления внешнего ключа на таблицу Department, поле Id
ALTER TABLE [dbo].[Employee] WITH CHECK ADD FOREIGN KEY([DepartmentId]) REFERENCES [dbo].[Department] ([Id]);
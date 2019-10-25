USE HumanResources
GO

-- очистить таблицы
DELETE FROM Employee; -- можно добиться похожего результата (после TRUNCATE - Id начнет опять генерироваться с 1) командой TRUNCATE которая пересоздает таблицу
DELETE FROM Department; -- но TRUNCATE не работает, например, на Department потому что на нее ссылается Employee внешним ключом

-- вставить сразу несколько записей путем указания нескольких значений после ключевого слова VALUES
-- у вас не получится выполнить этот запрос дважды потому что на поле Name есть ограничение уникальности
INSERT INTO Department (Name) VALUES ('Administration'), ('Cafeteria'), ('Human Resources'), ('Power'), ('Shipping'), ('Accounting'), ('Data processing'), ('Cleaning');

-- посмотреть содержимое таблицы Department
SELECT * FROM Department;

-- добавить в таблицу Employee начальников (ChiefId = NULL) отдела Administration, INSERT на основании результата выборки SELECT
-- поле Salary не указываем, его DEFAULT значение = 0
INSERT INTO Employee (ChiefId, Name, DepartmentId)
SELECT NULL, 'Bob', d.Id FROM Department d WHERE Name = 'Administration';

-- добавление начальников по отделам, подзапрос SELECT получает Id конкретной категории
INSERT INTO Employee (ChiefId, Name, DepartmentId)
VALUES (NULL, 'Steve', (SELECT d.Id FROM Department d WHERE Name = 'Cafeteria')),
	   (NULL, 'Gordon', (SELECT d.Id FROM Department d WHERE Name = 'Human Resources')),
	   (NULL, 'Denis', (SELECT d.Id FROM Department d WHERE Name = 'Power')),
	   (NULL, 'John', (SELECT d.Id FROM Department d WHERE Name = 'Shipping')),
	   (NULL, 'Samantha', (SELECT d.Id FROM Department d WHERE Name = 'Accounting')),
	   (NULL, 'Trace', (SELECT d.Id FROM Department d WHERE Name = 'Data processing'));

-- посмотреть все значения всех атрибутов всех рабочих
SELECT * FROM Employee

-- добавить 3 рабочих в подчинение к рабочему НЕ с именем 'Bob'
-- INSERT на основании выборки имен, который выполняет два подзапроса для каждого имени
INSERT INTO Employee (ChiefId, Name, DepartmentId)
SELECT (SELECT TOP 1 Id FROM Employee WHERE Name != 'Bob'), -- подзапрос получения идентификатора начальника
	   Names.Name, -- имя из FROM
	   (SELECT Id FROM Department WHERE Name = 'Administration') -- подзапрос получения идентификатора департамента 'Administration'
FROM (VALUES ('Raymond'), ('Hannah'), ('Ruby')) AS Names(Name);

SELECT * FROM Employee ORDER BY Name; -- смотрим содержимое Employee, отсортированной по колонке Name
SELECT * FROM Employee ORDER BY Name DESC; -- смотрим содержимое Employee, отсортированной по колонке Name в обратном порядке
SELECT * FROM Employee ORDER BY NEWID(); -- смотрим содержимое Employee, отсортированной в случайном порядке, NEWID() - генерация UNIQUEIDENTIFIER (GUID), тобишь сортировка происходит по сгенерированным GUID'ам

-- создать временную таблицу в которой сохраним множество имен для вставки в Employee
CREATE TABLE #names (Name nvarchar(100) UNIQUE);
INSERT INTO #names VALUES ('Lionel'), ('Kermit'), ('Hayden'), ('Rashad'), ('Kimberly'), ('Thaddeus'), ('Brynn'), ('Madonna'), ('Eagan'), ('Rudyard'), ('Aidan'), ('Kim'), ('Oscar'), ('Stewart'), ('Kirk'), ('Keith'), ('Blaine'), ('Eden'), ('Aubrey'), ('Lydia'), ('Rhea'), ('Shelby'), ('Haviva'), ('Miranda'), ('Dorian'), ('Reuben'), ('Michael'), ('Joy'), ('Thane'), ('Cynthia'), ('Chanda'), ('Macey'), ('Fay'), ('Ryder'), ('Olivia'), ('Imelda'), ('Marah'), ('Eric'), ('Denise'), ('Clark'), ('Cheryl'), ('Tyrone'), ('Otto'), ('Dakota'), ('Nora'), ('Neville'), ('Adena'), ('Hiram'), ('Cally'), ('Lois'), ('Cassandra'), ('Herman'), ('Len'), ('Walker'), ('Fiona'), ('Graiden'), ('Hamilton'), ('Cruz'), ('Axel'), ('Velma'), ('Mariam'), ('Jin'), ('Colt'), ('Kaitlin'), ('Frances'), ('Britanni'), ('Linus'), ('Wayne'), ('Knox'), ('Hyacinth'), ('Yael'), ('Lesley'), ('Jaime'), ('Aline'), ('Dalton'), ('Irene'), ('Scarlet'), ('Mariko'), ('Brady'), ('Blair'), ('Madeson'), ('Jena'), ('Josephine'), ('Joel'), ('Moana'), ('Colton'), ('Abbot'), ('Aristotle'), ('Perry'), ('Phillip'), ('Kamal'), ('Lamar'), ('Steel');

-- генерация подчиненных
DECLARE @currentName nvarchar(100) = (SELECT TOP 1 Name from #names); -- создать переменную и записать в нее первое имя из временной таблицы
DECLARE @departmentId int, @chiefId int; -- объявить переменные для хранения идентификаторов
-- цикл while
WHILE @currentName IS NOT NULL -- пока имена во временной таблице не закончатся
BEGIN
	SELECT TOP 1 @chiefId = Id, @departmentId = DepartmentId FROM Employee ORDER BY NEWID(); -- выбрать 1 случайного Employee и записать его Id и DepartmentId в @переменные; если сложно понять выполните SELECT * FROM Employee ORDER BY NEWID(); несколько раз и следите за порядком
	INSERT INTO Employee (ChiefId, Name, DepartmentId) VALUES (@chiefId, @currentName, @departmentId); -- вставить нового рабочего с полями из переменных
	DELETE FROM #names WHERE Name = @currentName; -- удалить текущее имя из временной таблицы имен
	SET @currentName = (SELECT TOP 1 Name from #names); -- выбрать следующее имя из таблицы или NULL если имена закончились
END;
DROP TABLE #names; -- уничтожить временную таблицу, это необязательная операция т.к. временные таблицы удаляются когда клиент, который их создал, закрывает соединение с базой данных

-- проставим случайную зарплату созданным рабочим
UPDATE Employee -- таблица
SET Salary = CAST(ABS(CHECKSUM(NewId())) AS MONEY) % 100000 / 100 + 500 -- не стоит особо вникать в генерацию, полученное число в пределах [500.00; 1500.00]
WHERE Salary = 0; -- проставить только тем у кого зарплата 0

-- посмотреть на результаты генерации данных
SELECT * FROM Employee ORDER BY Salary;
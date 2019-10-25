-- все данные о департаментах
SELECT * FROM Department;

-- все данные о рабочих
SELECT * FROM Employee;

SELECT * FROM Employee
ORDER BY Name; -- отсортировать рабочих по имени

SELECT * FROM Employee
WHERE Salary > 700; -- у кого зарплата больше 700

SELECT * FROM Employee
WHERE Salary > 700 AND ChiefId IS NULL; -- у кого зарплата больше 700 И кто является руководителем (в вашей базе таких может не быть)

SELECT * FROM Employee
WHERE Salary > 700 OR ChiefId IS NULL; -- у кого зарплата больше 700 ИЛИ кто является руководителем (в вашей базе таких может не быть, но очень маловероятно)

SELECT 1 FROM Employee; -- для каждого рабочего вывести 1 ¯\_(ツ)_/¯
SELECT COUNT(1) FROM Employee; -- посчитать рабочих, COUNT посчитает КОЛИЧЕСТВО единиц, можно написать COUNT(Id) или COUNT("blablabla"), результат не изменится

-- количество рабочих в департаментах
SELECT d.Name, -- имя департамента
       (SELECT COUNT(1) FROM Employee WHERE DepartmentId = d.Id)
           AS [Employees in departments] -- в квадратных скобках тоже можно писать, также как и в кавычках
FROM Department d;

-- рабочий в департаменте
SELECT e.Name, -- имя рабочего
	  (SELECT Name FROM Department d WHERE d.Id = e.DepartmentId) AS DepartmentName -- имя департамента рабочего, дать колонке имя DepartmentName
FROM Employee e
ORDER BY DepartmentName -- отсортировать по имени департамента

-- такой же запрос только с операцией JOIN - соединение
SELECT e.Name, -- имя рабочего 
       d.Name -- имя отдела
FROM Employee e -- выбрать из таблицы рабочих
INNER JOIN Department d -- соединение рабочих с департаментами
	ON e.DepartmentId = d.Id -- по Id департамента (внешний ключ Employee)
ORDER BY d.Name; -- отсортировать по имени департамента

SELECT MAX(Salary) FROM Employee; -- если COUNT считает, то MAX находит самый максимальный элемент, находит самую большую зарплату
SELECT MIN(Salary) FROM Employee; -- находит самую маленькую зарплату
SELECT AVG(Salary) FROM Employee; -- находит среднюю зарплату

SELECT (SELECT d.Name from Department d WHERE d.Id = DepartmentId), AVG(Salary) -- имя департамента и средняя зарплата по нему
FROM Employee
GROUP BY DepartmentId; /* сгруппировать рабочих по департаменту,
в SELECT может быть выбрана колонка, по которой производится группировка ИЛИ колонка, значения которой агрегируются какой либо функцией COUNT, AVG, MIN, MAX...
иначе SQL SERVER не может определиться какое значение показывать для одинаковых значений сгруппированной колонки
это как сгруппировать яблоки по цвету в коробки и вместо того чтобы посчитать, допустим, сколько яблок в каждой коробке, выбрать одно яблоко из каждой коробки,
КАКОЕ ЯБЛОКО ВЫБРАТЬ? Самое тяжелое? Самое гнилое? Самое первое?
*/

SELECT MIN(Name) FROM Employee; -- самое первое имя по алфавиту
SELECT MAX(Name) FROM Employee; -- самое последнее имя по алфавиту

SELECT
	d.Name,
	COUNT(e.Id) AS [Employees in departments],
	MAX(Salary) [Max salary in department]
FROM Employee e
INNER JOIN Department d ON e.DepartmentId = d.Id
GROUP BY d.Id, d.Name

-- департаменты без рабочих
SELECT d.* -- все колонки из департаментов
FROM Department d -- все записи из департаментов
LEFT JOIN Employee e -- и только те записи из рабочих
	ON e.DepartmentId = d.Id -- которые связаны с департаментом
WHERE e.Id IS NULL; -- где не нашлось рабочего для департамента

-- то же самое только с GROUP BY ... HAVING вместо WHERE
SELECT d.Name
FROM Department d
LEFT JOIN Employee e
	ON e.DepartmentId = d.Id
GROUP BY d.Name
HAVING COUNT(e.Id) = 0; -- условие по уже сгруппированным значениям, в какой коробке нету яблок?
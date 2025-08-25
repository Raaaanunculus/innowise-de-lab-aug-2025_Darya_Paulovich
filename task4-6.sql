--1. Найти ProjectName всех проектов, в которых 'Bob Johnson' работал более 150 часов.
SELECT Projects.ProjectName--выбираем названия проектов из таблицы Projects
FROM Projects
inner JOIN EmployeeProjects ON Projects.ProjectID = EmployeeProjects.ProjectID--соединяем с таблицей EmployeeProjects по ProjectID
inner JOIN Employees ON EmployeeProjects.EmployeeID = Employees.EmployeeID--соединяем с таблицей Employees по EmployeeID
WHERE Employees.FirstName = 'Bob' 
  AND Employees.LastName = 'Johnson' 
  AND EmployeeProjects.HoursWorked > 150;
--2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя бы один сотрудник из отдела 'IT'.
UPDATE Projects--обновляем таблицу
SET Budget = Budget * 1.10--увеличиваем бюджет
WHERE ProjectID IN (
    SELECT DISTINCT EmployeeProjects.ProjectID--SELECT DISTINCT используется для выборки уникальных значений из столбца 
    										  --у меня в коде если один и тот же проект встречается несколько раз 
    										  --(например, если в нём работают несколько it-сотрудников), 
    										  --DISTINCT оставляет только одно упоминание этого проекта.
    FROM EmployeeProjects 
    inner JOIN Employees ON EmployeeProjects.EmployeeID = Employees.EmployeeID--соединяем с таблицей Employees для проверки отдела
    WHERE Employees.Department = 'IT'--условие: сотрудник должен быть из отдела it
);
SELECT ProjectName, Budget FROM Projects;
--3. Для любого проекта, у которого еще нет EndDate (EndDate IS NULL), установить EndDate на один год позже его StartDate. 
UPDATE Projects
SET EndDate = StartDate + INTERVAL '1 year'
WHERE EndDate IS NULL;--если нет даты окончания устанавливаем ее
SELECT * FROM Projects;
--4. Вставить нового сотрудника и немедленно назначить его на проект 
--'Website Redesign' с 80 отработанными часами, все в рамках одной 
--транзакции. Использовать предложение RETURNING, чтобы получить 
--EmployeeID вновь вставленного сотрудника.
BEGIN;
WITH new_emp AS (--используем сте для вставки нового сотрудника
  INSERT INTO Employees (FirstName, LastName, Department, Salary)
  VALUES ('Angelina', 'Gribanova', 'HR', 150000.00)
  RETURNING EmployeeID--возвращает id нового сотрудника
)
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
SELECT 
  new_emp.EmployeeID --берем id из cte new_emp
  1, --ProjectID для проекта 'Website Redesign'
  80 --кол-во отработанных часов
FROM new_emp;
COMMIT;
SELECT * FROM Employees;
SELECT * FROM EmployeeProjects;
SELECT * FROM Projects;
--поиск нового сотрудника и его проект
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, 
       Projects.ProjectName, EmployeeProjects.HoursWorked
FROM Employees 
inner JOIN EmployeeProjects 
ON Employees.EmployeeID = EmployeeProjects.EmployeeID
inner JOIN Projects 
ON EmployeeProjects.ProjectID = Projects.ProjectID
WHERE Employees.LastName = 'Gribanova';

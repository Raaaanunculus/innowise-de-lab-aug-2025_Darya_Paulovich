-- 1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%. 
UPDATE Employees 
SET Salary = Salary * 1.10 --здесь увеличиваем зп
WHERE Department = 'HR';--по какому принципу
SELECT * FROM Employees;
--2. Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.
UPDATE Employees 
SET Department = 'Senior IT'--меняем на это 
WHERE Salary > 70000.00;--при условии
SELECT * FROM Employees;
-- 3. Удалить всех сотрудников, которые не назначены ни на один проект в таблице EmployeeProjects.
DELETE FROM Employees 
WHERE NOT EXISTS ( --используем подзапрос 
				   -- условие: удалять только те записи, для которых не существует соответствующих записей в подзапросе
    SELECT 1 FROM EmployeeProjects -- возвращает 1, если найдена хотя бы одна запись
    WHERE EmployeeProjects.EmployeeID = Employees.EmployeeID-- проверяем только записи для текущего сотрудника
);
SELECT * FROM Employees;
-- 4. Вставить новый проект и назначить на него двух существующих 
--сотрудников с определенным количеством HoursWorked в 
--EmployeeProjects, и все это в одном блоке BEGIN/COMMIT.
BEGIN;--начало транзакции
    INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate)
    VALUES (
        'New Project', 
        120000.00, 
        CURRENT_DATE, 
        CURRENT_DATE + INTERVAL '6 months'  --добавляем 6 месяцев к StartDate
    )
    RETURNING ProjectID;
    

    INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
    VALUES 
        (1, currval('projects_projectid_seq'), 40),  --currval('projects_projectid_seq') получает текущее значение последовательности для ProjectID
        											 -- projects_projectid_seq - имя последовательности, автоматически созданной для SERIAL поля
        											 --currval() возвращает последнее значение, сгенерированное в текущей сессии
        (3, currval('projects_projectid_seq'), 30);  
    -- вставляем две записи в EmployeeProjects, связывая сотрудников с новым проектом
    --используем currval() чтобы получить ID только что созданного проекта
COMMIT;--подтверждение транзакции
SELECT * FROM EmployeeProjects;
SELECT * FROM Projects;

--1. Вставить двух новых сотрудников в таблицу Employees.
INSERT INTO Employees (FirstName, LastName, Department, Salary)-- добавляем сотрудников с указанием имени, фамилии, отдела и зп
VALUES 
    ('Ratibor', 'Evseenko', 'Design', 70000.00),
    ('Geastapo', 'Sanko', 'Design', 65000.00);
--2. Выбрать всех сотрудников из таблицы Employees. 
SELECT * FROM Employees;--смотрим всех сотрудников
--3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'. 
SELECT FirstName, LastName 
FROM Employees 
WHERE Department = 'IT';
--4. Обновить Salary 'Alice Smith' до 65000.00.
UPDATE Employees 
SET Salary = 65000.00 --изменяем зп
WHERE FirstName = 'Alice' AND LastName = 'Smith';--иденцифицируем запись по имени фамилии
--5. Удалить сотрудника, чья LastName — 'Prince'.
ALTER TABLE EmployeeProjects
DROP CONSTRAINT employeeprojects_employeeid_fkey,--удаляем ограничение внешнего ключа
ADD CONSTRAINT employeeprojects_employeeid_fkey
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE;--создаем новое с каскадным удалением чтобы при удалении 
																			--сотрудника автоматически удалялисб записи в EmployeeProjects
DELETE FROM Employees 
WHERE FirstName = 'Diana' AND LastName = 'Prince';--удаляем диану
--6. Проверить все изменения, используя SELECT * FROM Employees
SELECT * FROM Employees;
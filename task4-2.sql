--1. Создать новую таблицу с именем Departments со столбцами: 
--DepartmentID (SERIAL PRIMARY KEY), DepartmentName 
--(VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)). 
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);
--2. Изменить таблицу Employees, добавив новый столбец с именем Email (VARCHAR(100)).
ALTER TABLE Employees --используем чтобы менять структуру существующей таблицы
ADD COLUMN Email VARCHAR(100);--добавляет столбик 
-- 3. Добавить ограничение UNIQUE к столбцу Email в таблице Employees, предварительно заполнив любыми значениями
UPDATE Employees-- обновляем существующие записи
SET email = LOWER(FirstName || '.' || LastName || '@company.com')--для строк глде email null устанавливаем значение в таком формате
WHERE email IS NULL;
SELECT * FROM Employees;
--4. Переименовать столбец Location в таблице Departments в OfficeLocation. 
ALTER TABLE Departments 
RENAME COLUMN Location TO OfficeLocation;--переименовываем
SELECT * FROM Departments ;
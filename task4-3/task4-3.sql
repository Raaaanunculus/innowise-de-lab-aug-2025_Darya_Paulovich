--Задание 3: DCL
CREATE USER ranunculus WITH PASSWORD 'sss';--создаем пользовавтеля и пароль
SELECT * FROM Employees; 
GRANT SELECT ON Employees TO ranunculus;--разрешаем SELECT
GRANT INSERT, UPDATE ON Employees TO ranunculus;--разрешаем INSERT и UPDATE
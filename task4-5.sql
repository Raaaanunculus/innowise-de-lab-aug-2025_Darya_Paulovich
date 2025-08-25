--1. Функция: Создать функцию PostgreSQL с именем 
--CalculateAnnualBonus, которая принимает employee_id и 
--Salary  в качестве входных данных и возвращает рассчитанную 
--сумму бонуса (10 % от Salary) для этого сотрудника. Используйте 
--PL/pgSQL для тела функции.
CREATE OR REPLACE FUNCTION CalculateAnnualBonus(--создаем функцию
    employee_id INT, 
    salary DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$--тело функцию
BEGIN
    RETURN salary * 0.10; --возвращаем бонус
END;
$$;
--2. Использовать эту функцию в операторе SELECT, чтобы увидеть потенциальный бонус для каждого сотрудника. 
SELECT EmployeeID, FirstName, Salary, CalculateAnnualBonus(EmployeeID, Salary) AS Bonus --вызываем функцию, ее результат будет в колонке Bonus 
FROM Employees;
--3. Представление (View): Создать представление с именем 
--IT_Department_View, которое показывает EmployeeID, 
--FirstName, LastName и Salary только для сотрудников из отдела 'IT'. 
CREATE VIEW IT_Department_View AS --создаем представление
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Department = 'IT';
--4. Выбрать данные из вашего представления IT_Department_View.
SELECT * FROM IT_Department_View;


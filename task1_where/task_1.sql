-- ч1з1: Найдите всех клиентов из страны 'USA', которым больше 25 лет. 
SELECT first_name, last_name, age, country --используемые данные таблицы
FROM Customers --берем данные из таблицы Customers
WHERE country = 'USA' AND age > 25 --при условии что страна заказчика США и ему больше 25


-- ч1з2: Выведите все заказы, у которых сумма (amount) больше 1000.
SELECT order_id, item, amount, customer_id --используемые данные таблицы
FROM Orders --берем данные из таблицы Orders
WHERE amount > 1000 --при условии что сумма заказа больше 1000
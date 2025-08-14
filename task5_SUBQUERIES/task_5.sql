-- ч5з1: Найдите всех клиентов, которые сделали заказ с максимальной суммой.
SELECT Customers.first_name, Customers.last_name, Orders.amount
FROM Customers --основная таблица
inner JOIN Orders --inner JOIN гарантирует, что будут только клиенты с заказами
ON Customers.customer_id = Orders.customer_id --соединяем таблицы по id клиента
WHERE Orders.amount = (SELECT MAX(amount) FROM Orders)--фильтруем заказы чтобы остались только с максимальной суммой 
													  --выполняется подзапрос (SELECT MAX(amount) FROM Orders) - он находит максимальную сумму заказа во всей таблице Orders
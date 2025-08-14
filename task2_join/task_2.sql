-- ч2з1: Получите список заказов вместе с именем клиента, который сделал заказ.
SELECT Customers.first_name, Customers.last_name, Orders.item, Orders.amount --используемые данные таблицы
FROM Orders --главная таблица
inner JOIN Customers -- inner join означает, что в результат попадут только доставки,у которых есть соответствующий клиент в таблице Customers
ON Orders.customer_id = Customers.customer_id --условие объединения таблиц


-- ч2з2: Выведите список доставок со статусом и именем клиента. 
SELECT  status, first_name, last_name  --используемые данные таблицы
FROM Shippings --главная таблица
inner JOIN Customers -- inner join означает, что в результат попадут только доставки,у которых есть соответствующий клиент в таблице Customers
ON Shippings.customer = Customers.customer_id --условие объединения таблиц
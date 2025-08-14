WITH CustomerOrders AS --объявляем СТЕ
--внутри скобок находится тело СТЕ
(
    SELECT 			
        Customers.customer_id, --id клиента
        Customers.first_name || ' ' || Customers.last_name AS full_name, --объедтняем его имя и фамилию через пробел
        Customers.country, --страна клиента
        COUNT(Orders.order_id) AS total_orders,--считаем какое у него кол-во заказов
        SUM(Orders.amount) AS total_amount--сумма заказов
    FROM Customers 
    inner JOIN Orders --выбираем только клиентов с заказами
    ON Customers.customer_id = Orders.customer_id--соединяем Customers  и Orders по id клиента
    GROUP BY Customers.customer_id, Customers.first_name, Customers.last_name, Customers.country--группировка по заданным полям
    HAVING COUNT(Orders.order_id) >= 2--клиент должен иметь от 2 заказов(фильтруем)
),
Delivered AS --второе CTE
(
    SELECT DISTINCT customer AS customer_id--выбираем уникальные id клиентов
    FROM Shippings
    WHERE status = 'Delivered'--доставленные заказы
)
SELECT 
    CustomerOrders.full_name,--полное имя клиента
    CustomerOrders.country,--его страна
    CustomerOrders.total_orders,--кол-во заказов 
    CustomerOrders.total_amount--сумма заказов
FROM CustomerOrders --источник данных первое СТЕ
inner JOIN Delivered 
ON CustomerOrders.customer_id = Delivered.customer_id --соединяем с клиентами у которых есть заказы по id
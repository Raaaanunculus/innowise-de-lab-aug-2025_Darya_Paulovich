-- ч6з1: Для каждого заказа добавьте колонку с суммой всех заказов этого клиента (используя 
-- оконную функцию).
SELECT 
    order_id, 
    customer_id, 
    item, 
    amount,
    SUM(amount) OVER (PARTITION BY customer_id) as total_by_customer --оконная функция: сумма всех заказов для каждого клиента: 
    																 --PARTITION BY customer_id - разделяем данные по клиентам
    																 --SUM(amount) - вычисляем сумму в каждой группе
    																 --total_by_customer - имя новой колонки с результатом
FROM Orders--берем данные из таблицы Orders
-- ч3з1: Подсчитайте количество клиентов в каждой стране. 
SELECT country, COUNT(*) as count --считаем кол-во записей в выбранной стране, as count для названия столбика
FROM Customers
GROUP BY country --группировка результатов по странам


-- ч3з2: Посчитайте общее количество заказов и среднюю сумму по каждому товару. 
SELECT 
    item, 
    COUNT(*) as count, 
     ROUND(AVG(amount), 2) as avg_amount --средняя цена(округляем)
FROM Orders --из таблицы Orders 
GROUP BY item --группируем по товарам

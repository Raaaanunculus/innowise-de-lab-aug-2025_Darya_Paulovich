--запрос 1: топ 5 песен по кол-ву доюавлений в плейлисты
SELECT
    dim_song.title AS "Название песни",-- выбираем название песни из таблицы dim_song
    dim_song.artist_name AS "Исполнитель", -- выбираем имя исполнителя из таблицы dim_song
    SUM(fact_playlist_addition.addition_count) AS "Количество добавлений" -- суммируем addition_count
FROM fact_playlist_addition -- обращаемся к фактовой таблице
inner JOIN dim_song ON fact_playlist_addition.song_sk = dim_song.song_sk-- соединяем с таблицей dim_song по ключу песни
GROUP BY dim_song.title, dim_song.artist_name -- группируем результаты по названию песни и исполнителю
ORDER BY "Количество добавлений" DESC-- сортируем результат по убыванию по кол-ву добавлений
LIMIT 5;-- ограничиваем вывод до 5 записей 

--запрос 2: в какое время суток добавляют самые популярные песни?
SELECT
    fact_playlist_addition.hour_of_day AS "Час дня",-- выбираем час дня из фактовой таблицы
    COUNT(fact_playlist_addition.addition_count) AS "Активность (кол-во добавлений)", -- считаем общее количество добавлений для каждого часа
    ROUND(AVG(fact_playlist_addition.song_popularity_index), 3) AS "Средняя популярность песен" -- вычисляем среднюю популярность песен для каждого часа
FROM fact_playlist_addition 
GROUP BY fact_playlist_addition.hour_of_day-- группируем данные по часам 
ORDER BY "Средняя популярность песен" DESC; -- сортируем результат по убыванию средней популярности песен

--запрос 3: рейтинг артистов по средней узнаваемости среди пользователей, которые добавляют их музыку
SELECT
    dim_song.artist_name AS "Исполнитель", -- выбираем имя исполнителя из таблицы  dim_song
    COUNT(fact_playlist_addition.addition_count) AS "Песен добавлено",-- считаем общее количество добавлений песен этого исполнителя
    ROUND(AVG(fact_playlist_addition.artist_familiarity_score), 3) AS "Средняя узнаваемость артиста"  -- вычисляем среднюю узнаваемость исполнителя
FROM fact_playlist_addition --обращаемся к фактовой таблице
inner JOIN dim_song ON fact_playlist_addition.song_sk = dim_song.song_sk -- соединяем с таблицей dim_song для получения информации об исполнителях
GROUP BY dim_song.artist_name -- все добавления песен одного исполнителя объединяются в одну группу
HAVING COUNT(fact_playlist_addition.addition_count) >= 2 -- покажем только тех, кого добавляли больше 1 раза
ORDER BY "Средняя узнаваемость артиста" DESC;-- сортируем результат по убыванию средней узнаваемости

--запрос 4: сравнение публичных и приватных плейлистов по популярности добавляемого контента
SELECT
    CASE --это выражение преобразует значения true/false в понятные слова-метки
        WHEN dim_playlist.is_public THEN 'Публичный'  -- если плейлист публичный (is_public = true)
        -- во всех остальных случаях (is_public = false или null)
        ELSE 'Приватный' 
    END AS "Тип плейлиста",
    ROUND(AVG(fact_playlist_addition.song_popularity_index), 3) AS "Средняя популярность песен",  -- вычисляем среднюю популярность песен для каждого типа плейлиста
    ROUND(AVG(fact_playlist_addition.artist_familiarity_score), 3) AS "Средняя узнаваемость артиста" -- вычисляем среднюю узнаваемость артистов для каждого типа плейлиста
FROM fact_playlist_addition -- обращаемся к фактовой таблице 
inner JOIN dim_playlist ON fact_playlist_addition.playlist_sk = dim_playlist.playlist_sk-- соединяем с таблицей dim_playlist для получения информации о типе плейлиста
GROUP BY dim_playlist.is_public;-- все добавления в плейлисты с одинаковым статусом (публичный/приватный) объединяются

--запрос 5: общая статистика по всем метрикам
SELECT
    COUNT(*) AS "Всего событий добавления", -- подсчитываем общее кол-во записей в фактовой таблице
    SUM(fact_playlist_addition.addition_count) AS "Общее количество добавлений (сумма)",--суммируем значения из всех строк таблицы.
    ROUND(AVG(fact_playlist_addition.song_popularity_index), 3) AS "Средняя популярность песни", -- вычисляем среднюю популярность песен по всем добавлениям
    ROUND(AVG(fact_playlist_addition.artist_familiarity_score), 3) AS "Средняя узнаваемость артиста", -- вычисляем среднюю узнаваемость артистов по всем добавлениям
    MIN(fact_playlist_addition.hour_of_day) AS "Самое раннее добавление (час)",-- находим самый ранний час дня, когда происходили добавления
    MAX(fact_playlist_addition.hour_of_day) AS "Самое позднее добавление (час)"-- находим самый поздний час дня, когда происходили добавления
FROM fact_playlist_addition;
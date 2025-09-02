import datetime # импортируем для работы с датой и временем

def show_current_time():
    current_datetime = datetime.datetime.now()
    # форматируем дату и время 
    formatted_time = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
    print(f"Текущие дата и время: {formatted_time}")

# вызов функции
show_current_time()

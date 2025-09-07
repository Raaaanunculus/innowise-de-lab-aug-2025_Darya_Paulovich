number_1 = int(input("введите 1 число: "))
number_2 = int(input("введите 2 число: "))
sign = input("введите знак: ")

# инициализируем res значением None
res = None

if sign == "+":
    res = number_1 + number_2
elif sign == "-":
    res = number_1 - number_2
elif sign == "*":
    res = number_1 * number_2
elif sign == "/":
    # проверка деления на ноль
    if number_2 != 0:
        res = number_1 / number_2
    else:
        print("ошибка: деление на ноль!")
else:
    print("ошибка: неверный знак!")

# вывод результата только если он был вычислен
if res is not None:
    print(number_1, sign, number_2, "=", res)
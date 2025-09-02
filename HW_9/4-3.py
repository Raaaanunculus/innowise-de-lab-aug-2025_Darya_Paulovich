def calculate_average_score(scores, ignore_lowest=False):
    # создаем копию списка оценок, чтобы не изменять оригинальный список
    scores_to_use = scores.copy()

    # проверяем, нужно ли игнорировать наименьшую оценку и есть ли больше одной оценки
    if ignore_lowest and len(scores) > 1:
        # находим минимальную оценку в списке
        min_score = min(scores_to_use)
        # удаляем эту минимальную оценку из списка
        scores_to_use.remove(min_score)

    # вычисляем среднее арифметическое
    average = sum(scores_to_use) / len(scores_to_use)
    # возвращаем вычисленное среднее значение
    return average

# создаем список данных студентов
student_data = [
    {'name': 'Алексей', 'scores': [85, 92, 78, 95]},
    {'name': 'Марина', 'scores': [65, 70, 58, 82]},
    {'name': 'Светлана', 'scores': [98, 95, 100]}
]

print("расчёт среднего балла:")

# проходим по каждому студенту в списке 
for student in student_data:
    # берем имя студента 
    name = student['name']
    # беоем список оценок студента 
    scores = student['scores']

    # первый расчет: считаем среднее со всеми оценками
    avg_all = calculate_average_score(scores)
    # второй расчет: считаем среднее, игнорируя худшую оценку
    avg_ignored = calculate_average_score(scores, ignore_lowest=True)

    # выводим имя студента
    print(f"{name}:")
    # выводим средний балл со всеми оценками 
    print(f"  со всеми оценками: {avg_all:.2f}")
    # выводим средний балл без худшей оценки 
    print(f"  без худшей оценки: {avg_ignored:.2f}")
    print()
    
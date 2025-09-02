# объявляем функцию, которая принимает список чисел и целевое значение
def find_two_sum_indices(nums, target):
    # проходим по всем элементам списка по их индексам
    for i in range(len(nums)):
        # вычисляем, какое число нужно найти для текущего числа nums[i]
        # чтобы в сумме получилось target
        needed_value = target - nums[i]
        # проверяем, есть ли нужное число в оставшейся части списка 
        if needed_value in nums[i+1:]:
            # если число найдено, находим его точный индекс в исходном списке
            # начинаем поиск с позиции i+1, чтобы не использовать тот же элемент дважды
            j = nums.index(needed_value, i+1)
            # возвращаем индексы двух чисел, дающих в сумме target
            return [i, j]
    # если ни одна пара не найдена, возвращаем none
    return None

nums1 = [2, 7, 11, 15]
target1 = 9
print(f"для nums={nums1}, target={target1}: {find_two_sum_indices(nums1, target1)}")

nums2 = [3, 2, 4]
target2 = 6
print(f"для nums={nums2}, target={target2}: {find_two_sum_indices(nums2, target2)}")
fruits = ["apple", "banana"]
print(f"исходный список: {fruits}")

# append() добавляет переданный элемент в самый конец
fruits.append("orange")
print(f"1. после добавления 'orange': {fruits}")

# insert(индекс, элемент) вставляет элемент перед указанным индексом
fruits.insert(1, "grape")
print(f"2. после вставки 'grape' на индекс 1: {fruits}")

# remove(элемент) ищет первое вхождение этого элемента и удаляет его
fruits.remove("banana") 
print(f"3. после удаления 'banana': {fruits}")

# sort() изменяет исходный список, расставляя элементы в порядке возрастания
fruits.sort()
print(f"4. после сортировки: {fruits}")

# reverse() изменяет исходный список, меняя порядок элементов
fruits.reverse()
print(f"5. после реверса: {fruits}")

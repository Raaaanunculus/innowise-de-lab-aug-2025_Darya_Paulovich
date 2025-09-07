words = ["hello", "world", "python", "code"]

# берем длины слов из списка
word_lengths = [len(word) for word in words]
print(f"1. список длин слов: {word_lengths}")

# для каждого слова в списке проверяем условие (if len(word) > 4)
# если условие true, слово попадает в новый список
long_words = [word for word in words if len(word) > 4]
print(f"2. слова длиннее 4 символов: {long_words}")

# для каждого слова в списке создаем пару "слово: длина"
word_dict = {word: len(word) for word in words}
# выводим получившийся словарь
print(f"3. словарь {{слово: длина}}: {word_dict}")

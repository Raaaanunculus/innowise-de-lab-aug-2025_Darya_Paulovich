email = "USER@DOMAIN.COM"

# lower() возвращает копию строки, где все буквы стали маленькими
formatted_email = email.lower()
# выводим результат
print(f"1. отформатированный email: {formatted_email}")

# split('@') разбивает строку на список частей, используя '@' как разделитель
# мы сразу сохраняем две части списка в две переменные: username и domain
username, domain = formatted_email.split('@')
# выводим обе части
print(f"2. разделенные части: имя пользователя = '{username}', домен = '{domain}'")

result_string = f"username: {username}, domain: {domain}"
print(f"3. {result_string}")

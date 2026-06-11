from django.shortcuts import render, redirect
from .models import Users, Books

def login_view(request):
    # 1. Отправка данных при авторизации
    if request.method == "POST":
        # 1.1 Если нажали "Войти как гость"
        if 'quest' in request.POST:
            request.session['fio'] = 'Гость'
            request.session['role'] = 'Гость'
            return redirect('books_page')
        
        # 1.2 Если авторизация производится не анонимно

        login = request.POST.get('login')
        password = request.POST.get('password')

        # Простая проверка по БД (ищем по почте и паролю)

        user = Users.objects.filter(mail=login, password=password).first()
        if user:
            # Записываем в сессию ФИО и Роль
            request.session['fio'] = f"{user.last_name} {user.first_name}"
            request.session['role'] = user.role.name
            return redirect('books_page')
        else:
            return render(request, 'store/login.html', { 'error': 'Ошибка входа!' })
    
    # 3. Переотрисовка странички после любых изменений
    return render(request, 'store/login.html')

def logout_view(request):
    request.session.flush() # 1. Удаление всего из текущей сессии
    return redirect('login_page') # 2. Переоткрытие странички авторизации

def books_view(request):
    # 1. Достаём все книги из автосгенерированной таблицы
    books = Books.objects.all()

    # 2. Поиск
    search = request.GET.get('search', '')
    if search:
        books = books.filter(name__icontains=search) # incontains - фильтр, игнорирующий регистр букв и ищущий частичное совпадение

    # 3. Сортировка (по количеству на складе - по заданию!)
    sort = request.GET.get('sort')
    if sort == 'asc':
        books = books.order_by('quantity_in_stock') # order_by - метод сортировки джанго
    elif sort == 'desc':
        books = books.order_by('-quantity_in_stock')

    # 4. Считаем итоговую цену с учётом скидки (при наличии)
    for book in books:
        if book.current_discount and book.current_discount > 0:
            book.final_price = book.price * (1 - (book.current_discount / 100))
        else:
            book.final_price = book.price

    # 5. Контекст для работы приложения
    context = {
            'books': books,
            'fio': request.session.get('fio', 'Гость'),
            'role': request.session.get('role', 'Гость'),
            'search_val': search,
            'sort_val': sort,
    }
    # 6. Отрисовка любых изменнеий
    return render(request, 'store/books.html', context)
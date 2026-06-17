from django.shortcuts import render, redirect
from .models import Users, Products  # Импортируем Products вместо Books

def login_view(request):
    if request.method == "POST":
        # Если нажали "Войти как гость"
        if 'guest' in request.POST:
            request.session['fio'] = 'Гость'
            request.session['role'] = 'Гость'
            return redirect('products_page')  # Имя URL поменял на products_page
        
        # Если ввели логин и пароль
        login = request.POST.get('login')
        password = request.POST.get('password')

        # Ищем по почте и паролю
        user = Users.objects.filter(mail=login, password=password).first()
        if user:
            # Записываем в сессию ФИО (включая отчество) и Роль
            request.session['fio'] = f"{user.last_name} {user.first_name} {user.father_name}"
            request.session['role'] = user.role.name
            return redirect('products_page')
        else:
            return render(request, 'store/login.html', { 'error': 'Ошибка входа или неверные данные!' })
    
    return render(request, 'store/login.html')

def logout_view(request):
    request.session.flush() 
    return redirect('login_page') 

def products_view(request): # Переименовал функцию
    products = Products.objects.all()

    # Поиск по названию
    search = request.GET.get('search', '')
    if search:
        products = products.filter(name__icontains=search)

    # Сортировка по количеству на складе
    sort = request.GET.get('sort')
    if sort == 'asc':
        products = products.order_by('quantity_in_stock')
    elif sort == 'desc':
        products = products.order_by('-quantity_in_stock')

    # Расчет финальной цены с учетом скидки
    for product in products:
        # Проверяем, что скидка не None и больше нуля
        if product.discount and product.discount > 0:
            product.final_price = product.price * (1 - (product.discount / 100))
        else:
            product.final_price = product.price

    context = {
        'products': products,
        'fio': request.session.get('fio', 'Гость'),
        'role': request.session.get('role', 'Гость'),
        'search_val': search,
        'sort_val': sort,
    }
    
    return render(request, 'store/products.html', context)
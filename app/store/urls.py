from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login_page'),
    path('books/', views.books_view, name='books_page'),
    path('logout/', views.logout_view, name='logout'),
]
from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login_page'),
    path('products/', views.products_view, name='products_page'),
    path('logout/', views.logout_view, name='logout_page'),
]

from django.urls import path
from . import views

urlpatterns = [ 
    path('', views.index, name='index'),
    path('user-login', views.login_request, name='user.login'), #localhost:8000/shop/user-login
    path('user-logout', views.logout_request, name='user.logout'),
    path('shop-activities', views.activities, name='shop.activities'), 
    path('product-data', views.product_data, name='product.data'),
    path('<int:cart_id>/data', views.send_data_to_cart, name='data.send'),
    path('<int:cart_id>/completed', views.completed, name='task-complete'),
    path('<int:id>/verify-completion', views.verify_completion, name='verify-completion')
]



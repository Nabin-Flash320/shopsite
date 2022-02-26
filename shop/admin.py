from django.contrib import admin
from .models import Products, Cart


# Register your models here.
# admin-username: ndj320
# admin-password: nabin

@admin.register(Products)
class ProductAdmin(admin.ModelAdmin):
    list_display = ("product_id", "product_name", "product_price", "product_mfd", "product_epd", "product_quantity")


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('pk', 'cart_id', 'product_id', 'product_count', 'completed')

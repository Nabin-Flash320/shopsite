from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Products(models.Model):
    product_id = models.PositiveIntegerField(primary_key=True) 
    product_name = models.CharField(max_length=200)
    product_price = models.PositiveIntegerField()
    product_mfd = models.DateField()
    product_epd = models.DateField()
    product_quantity = models.PositiveIntegerField()

    def Meta():
        ordering = ("Product_id", "Product_name", "Product_price", "Product_mfd", "Product_epd", "Product_quantity")


    def __str__(self) :
        return f"{self.product_id}, {self.product_name}, {self.product_price}, {self.product_mfd}, {self.product_epd}, {self.product_quantity}"


class Cart(models.Model):
    key = models.PositiveIntegerField(primary_key=True)
    cart_id = models.PositiveIntegerField()
    product_id = models.PositiveIntegerField()
    product_count = models.PositiveIntegerField()
    completed = models.BooleanField(default=False)

    def Meta():
        ordering = ('key', 'cart_id', 'product_id', 'product_count', 'completed')
    
    def __str__(self):
        return "{0}, {1}, {2}, {3}".format(self.pk, self.cart_id, self.product_id, self.product_count, self.completed)



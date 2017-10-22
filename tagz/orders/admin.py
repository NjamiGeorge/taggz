from django.contrib import admin

# Register your models here.
from .models import GuestCheckout,UserAddress,Order

admin.site.register(GuestCheckout)
admin.site.register(UserAddress)
admin.site.register(Order)

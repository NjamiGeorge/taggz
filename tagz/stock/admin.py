from django.contrib import admin
from .models import Product,Supplier,Customer,ProductImage,Checkout,Category,Variation,Shoe

admin.site.register(Product)
admin.site.register(Supplier)
admin.site.register(Customer)
admin.site.register(ProductImage)
admin.site.register(Category)
admin.site.register(Checkout)
admin.site.register(Variation)
admin.site.register(Shoe)
from __future__ import unicode_literals
from django.core.urlresolvers import reverse
from django.db.models.signals import pre_save,post_save, post_delete
from decimal import Decimal

from django.db import models
from django.conf import settings
from stock.models import Variation

class CartItem(models.Model):
	cart=models.ForeignKey("Cart", on_delete=models.CASCADE)
	item=models.ForeignKey(Variation)
	quantity=models.PositiveIntegerField(default=1)
	line_item_total=models.DecimalField(max_digits=10, decimal_places=2) #we always want to have this so we use presave

	def __unicode__(self):
		return self.item.product.name +"-"+ self.item.title

	def remove(self):
		return self.item.remove_from_cart()

	def product_item(self):
		self.item +"-"+ self.item.product


def cart_item_presave_receiver(sender,instance,*args,**kwargs):
	qty=instance.quantity
	if int(qty) >= 1:
		price=instance.item.get_price()
		line_item_total=Decimal(qty) * Decimal(price)
		instance.line_item_total=line_item_total

pre_save.connect(cart_item_presave_receiver, sender=CartItem)


def cart_item_postsave_receiver(sender,instance,*args,**kwargs):
	instance.cart.update_subtotal()

post_save.connect(cart_item_postsave_receiver,sender=CartItem)

post_delete.connect(cart_item_postsave_receiver,sender=CartItem)

class Cart(models.Model):
	user=models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE, default=1)
	item=models.ManyToManyField(Variation, through=CartItem)
	timestamp=models.DateTimeField(auto_now_add=True,auto_now=False)
	updated=models.DateTimeField(auto_now_add=False,auto_now=True)
	subtotal=models.DecimalField(max_digits=20, decimal_places=2, default=0)
	tax_percentage=models.DecimalField(max_digits=10,decimal_places=5, default=0.085)
	#tax_total=models.DecimalField(max_digits=50,decimal_places=2,default=25.00,null=True)
	total=models.DecimalField(max_digits=60,decimal_places=2,default=25.00)

	def __unicode__(self):
		return str(self.id)

	def update_subtotal(self):
		subtotal=0
		items=self.cartitem_set.all()
		for item in items:
			subtotal+=item.line_item_total
		self.subtotal=subtotal
		self.save()

def do_tax_and_total_receiver(sender,instance,*args,**kwargs):
	subtotal=instance.subtotal
	total=round(subtotal,2)
	instance.total=total
	

pre_save.connect(do_tax_and_total_receiver,sender=Cart)
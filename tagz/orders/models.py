from __future__ import unicode_literals
import braintree
from django.core.urlresolvers import reverse
from django.db import models
from django.conf import settings
from cart.models import Cart
from decimal import Decimal
from datetime import *
from django.utils import timezone
from django.db.models.signals import pre_save,post_save, post_delete
from phonenumber_field.modelfields import PhoneNumberField




if settings.DEBUG:
	braintree.Configuration.configure(
		braintree.Environment.Sandbox,
		merchant_id=settings.BRAINTREE_MERCHANT_ID,
		public_key=settings.BRAINTREE_PUBLIC,
		private_key=settings.BRAINTREE_PRIVATE
	)

	# braintree.Configuration.configure(
	# 	braintree.Environment.Sandbox,
	# 	"rb79swscmgmtzpm6",
	# 	"vb6rkhk8qvg5qwmn",
	# 	"13e6ad784c7a9d8f34d187eab54e79b9",
	# 	)
# Create your models here.
class GuestCheckout(models.Model):
	user=models.OneToOneField(settings.AUTH_USER_MODEL,null=True,blank=True)
	email=models.EmailField(unique=True)
	braintree_id=models.CharField(max_length=120,null=True,blank=True)


	def __unicode__(self):
		return self.email 

	@property
	def get_braintree_id(self,):
		instance = self
		if not instance.braintree_id:
			result = braintree.Customer.create({
    			"email": instance.email,
    		# "phone": "312.555.1234",
			})
			if result.is_success:
				instance.braintree_id=result.customer.id
				instance.save()
		return instance.braintree_id

	def get_client_token(self):
		customer_id=self.get_braintree_id
		if customer_id:
			client_token= braintree.ClientToken.generate({
				"customer_id":customer_id
			})
			return client_token
		return None
# class Order(models.Model):

#new signal for user checkout
def update_braintree_id(sender,instance,*args,**kwargs):
	if not instance.braintree_id:
		result = braintree.Customer.create({
    		"email": instance.email,
    		# "phone": "312.555.1234",
		})
		if result.is_success:
			instance.braintree_id=result.customer.id
			instance.save()


post_save.connect(update_braintree_id,sender=GuestCheckout)

ADDRESSES= (
	('billing','Billing'),
	('shipping','Shipping'),
)

class UserAddress(models.Model):
	user=models.ForeignKey(GuestCheckout, on_delete=models.CASCADE,null=False, blank=False)
	type=models.CharField(max_length=20,choices=ADDRESSES) #tuple above
	street=models.CharField(max_length=50)
	city=models.CharField(max_length=50)
	phone=PhoneNumberField(null=True)
	postal_code=models.CharField(max_length=70)
	post_address=models.IntegerField()
	

	def __unicode__(self):
		return self.street

	def get_address(self):
		return '%s, %s, %s' %(self.street,self.city,self.post_address)

ORDER_STATUS=(
	('created','Created'),
	('paid','Paid'),
	('shipped','Shipped'),
	)

class Order(models.Model):
	cart=models.ForeignKey(Cart)
	user=models.ForeignKey(GuestCheckout, on_delete=models.CASCADE, null=True)
	status=models.CharField(max_length=120,choices=ORDER_STATUS, default='created')
	shipping_address=models.ForeignKey(UserAddress,related_name='shipping_address',null=True)
	billing_address=models.ForeignKey(UserAddress,related_name='billing_address',null=True)
	shipping_total_price=models.DecimalField(decimal_places=2,max_digits=10,default=10.99)
	date=models.DateTimeField(default=timezone.now)
	order_id=models.CharField(max_length=10, null=True, blank=True)
	order_total=models.DecimalField(decimal_places=2,max_digits=10)

	def __unicode__(self):
		return str(self.cart.id)

	class Meta:
		ordering=['-id']

	def mark_completed(self,order_id=None):
		self.status = "paid"
		if order_id and not self.order_id:
			self.order_id=order_id
		self.save()

	def get_absolute_url(self):
		return reverse("order_detail",kwargs={"pk":self.pk})

def order_pre_save(sender,instance,*args,**kwargs):
	shipping_total_price=instance.shipping_total_price
	cart_total=instance.cart.total
	order_total=Decimal(shipping_total_price) + Decimal(cart_total)
	instance.order_total = Decimal(order_total)

pre_save.connect(order_pre_save,sender=Order)

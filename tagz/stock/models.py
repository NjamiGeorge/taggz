from __future__ import unicode_literals
from django.db import models
from django.db.models.query import QuerySet
from django.conf import settings
from django.core.urlresolvers import reverse
from django.utils import timezone
from datetime import timedelta,date
from django.db.models.signals import post_save


def upload_to(instance,filename):
	return "%s/%s" %(instance.id, filename)

# class ProductQueryset(models.QuerySet):
# 	def trousers(self):
# 		return self.filter(category=trousers)

# class ProductsManager(models.Manager):
# 	def get_queryset(self):
# 		return ProductQueryset(self.model, using=self.db)

# 	def trousers(self):
# 		return self.get_queryset().trousers()

# 	def all(self):
# 		return self.get_queryset()



#to get related items

class ProductQuerySet(models.QuerySet):
	def available(self):
		return self.filter(status='y')

	def sold_out(self):
		return self.filter(status='n')

class ProductManager(models.Manager):
	def get_queryset(self):
		return ProductQuerySet(self.model,using=self._db)

	def related_products(self,instance):
		prod_one=self.get_queryset().filter(category=instance.category.cat_id)
		prod_two=prod_one.exclude(id=instance.id).order_by('?')[:6]
		return prod_two

	def all(self,*args,**kwargs):
		return self.get_queryset().available()

	def sold_out(self,*args,**kwargs):
		return self.get_queryset().sold_out()

class Product(models.Model):

	SIZES=(
		('extra small','extra small'),
		('small','small'),
		('medium', 'medium'),
		('large','large'),
		('extra large','extra large'),
		('doubel xl','extra x large'),
		('elastic','elastic'),
		('size 30','size 30'),
		('size 32','size 32'),
		('size 34','size 34'),
		('size 36','size 36'),
		('size 38','size 38'),
		('size 40','size 40'),
		('size 42','size 42'),

	)

	STATS=(
		('y','yes'),
		('n','no'),
		)


	name=models.CharField(max_length=100)
	price=models.PositiveIntegerField()
	quantity=models.PositiveIntegerField()
	buying_price=models.PositiveIntegerField()
	supplier=models.ForeignKey("Supplier", on_delete=models.CASCADE)
	category=models.ForeignKey("Category", on_delete=models.CASCADE)
	size=models.CharField(max_length=20, choices=SIZES, default="elastic")
	entry_date=models.DateField(default=date.today)
	image=models.ForeignKey("ProductImage", related_name='product_image', on_delete=models.CASCADE, null=True,blank=True)
	details=models.CharField(max_length=50, null=True, blank=True, default="branded")
	status=models.CharField(max_length=10, choices=STATS, default='y')
	
	objects=ProductManager()
	# related=ProductManager()

	def __unicode__(self):
		return self.name

	def get_absolute_url(self):
		return reverse('product_detail', kwargs={'pk': self.pk })

class Shoe(models.Model):
	name=models.CharField(max_length=20)
	buying_price=models.PositiveIntegerField()
	price=models.PositiveIntegerField()
	size=models.CharField(max_length=20)
	image=models.ForeignKey("ProductImage", related_name='shoe_image', on_delete=models.CASCADE, null=True,blank=True)

	def __unicode__(self):
		return self.name

	def get_absolute_url(self):
		return reverse('product_detail', kwargs={'pk': self.pk })



class Variation(models.Model):
	product=models.ForeignKey(Product)
	title=models.CharField(max_length=50)
	price=models.PositiveIntegerField()
	sale_price=models.PositiveIntegerField(null=True,blank=True)
	inventory=models.PositiveIntegerField(default="-1",null=True,blank=True)

	def __unicode__(self):
		return self.title

	def get_price(self):
		if self.sale_price is not None:
			return self.sale_price
		else:
			return self.price

	def get_absolute_url(self):
		return self.product.get_absolute_url()

	def add_to_cart(self):
		return "%s?item=%s&qty=1" % (reverse("cart"), self.id)

	def remove_from_cart(self):
		return "%s?item=%s&qty=1&delete=True" % (reverse("cart"), self.id)

	def get_title(self):
		return "%s - %s" % (self.product.name, self.title)

def product_post_saved_receiver(sender,instance,created,*args,**kwargs):
	product=instance
	variations=product.variation_set.all()
	#same as saying. variations=Variation.objects.filter(product=product)
	if variations.count == 0:
		new_var=Variation()
		new_var.product=product
		new_var.title='default'
		new_var.price=product.price
		new_var.save()

post_save.connect(product_post_saved_receiver,sender=Product)


class Supplier(models.Model):
	name=models.CharField(max_length=100)
	contact=models.IntegerField()
	item=models.CharField(max_length=100)

	def __unicode__(self):
		return self.name

class Customer(models.Model):
	firstname=models.CharField(max_length=50)
	lastname=models.CharField(max_length=50, blank=True, null=True)
	contact=models.PositiveIntegerField()
	created_at=models.DateField(auto_now_add=True,auto_now=False, null=True)
	size=models.CharField(max_length=10,null=True,blank=True)
	product=models.CharField(max_length=20, null=True)


	def __unicode__(self):
		return self.firstname



class Category(models.Model):
	cat_id=models.AutoField(primary_key=True)
	title=models.CharField(max_length=100)
	description=models.CharField(max_length=100, null=True, blank=True,default='medium')

	def __unicode__(self):
		return self.title


class ProductImage(models.Model):
	product=models.ForeignKey(Product, on_delete=models.CASCADE,null=True, blank=True)
	image=models.ImageField(upload_to=upload_to,null=True,blank=True)
	

	def __unicode__(self):
		return self.product.name


class Checkout(models.Model):
	name=models.CharField(max_length=50,null=True, blank=True)
	size=models.CharField(max_length=50,null=True,blank=True)
	price=models.IntegerField(null=True,blank=True)
	quantity=models.PositiveIntegerField(null=True, default=1)
	contact=models.IntegerField(null=True)

	objects=models.Manager()

	def __unicode__(self):
		return str(self.contact)








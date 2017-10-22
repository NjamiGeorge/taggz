from django.shortcuts import render
from django.contrib import messages

# Create your views here.
from django.db.models import Q

from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.views.generic.edit import FormMixin,FormView, CreateView
from django.views.generic.edit import SingleObjectMixin
from django.shortcuts import get_object_or_404
from django.utils import timezone
from datetime import timedelta,datetime
from django.http import Http404, HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.core.mail import send_mail
from django.views import View

from django_filters import FilterSet
from .models import Product, Customer, Supplier, ProductImage, Category,Checkout, Shoe
from .forms import CustomerForm

# class listShirts(SingleObjectMixin, ListView):
# 	model=Product
# 	template_name="stock/trousers.html"
# 	#context_object_name="trousers"
# 	#product_categories=Product.objects.all()

# 	def get(self,request,*args,**kwargs):
# 		self.object=self.get_object(queryset=Category.objects.filter(title='trousers'))
# 		return super(listShirts,self).get(request,*args,**kwargs)

# 	def get_context_data(self,*args,**kwargs):
# 		context=super(listShirts,self).get_context_data(*args,**kwargs)
# 		context['trousers']=self.object()
# 		return context

# 	def get_queryset(self):
# 		#query=super(listShirts,self).get_context_data(*args,**kwargs)
# 		#variation_trousers=Category.objects.filter(title='trousers')
# 		#trousers=Product.objects.filter(category=variation_trousers)
# 		return self.object.product_set.all()



class ListProducts(ListView):
	#model=ProductImage
	model=Product
	prod_images=ProductImage.objects.all()
	# product_categories=Product.objects.all()
	template_name="stock/product_list.html"
	# template_name="stock/shirts.html"


	def get_context_data(self,*args,**kwargs):
		context=super(ListProducts,self).get_context_data(*args,**kwargs)
		context['search']=self.request.GET.get("search")
		#context['latest']=Product.objects.filter(entry_date__gte=self.recent)
		return context
	
	def get_queryset(self,*args,**kwargs):
		qs=super(ListProducts,self).get_queryset(*args,**kwargs)
		search=self.request.GET.get("search")
		if search:
			qs=self.model.objects.filter(
				Q(name__icontains=search) |
				Q(details__icontains=search) 
				)
		return qs

# class ListShoes(ListView):
# 	model=Shoe
# 	template_name='stock/shoes.html'
# 	queryset=Shoe.objects.all()

# 	def get_context_data(self,*args,**kwargs):
# 		context=super(ListShoes,self).get_context_data(*args,**kwargs)

# 		return context


def get_customer(request):
	# form=CustomerForm(request.POST or None)
	# if request.method == 'GET':
	name=request.POST.get("name")
	contact=request.POST.get("contact")
	created=datetime.now()
	size=request.POST.get("size")
	product=request.POST.get("product")
	if name and contact:
		new_customer,created=Customer.objects.get_or_create(firstname=name,contact=contact, created_at=created,size=size, product=product)
	return HttpResponseRedirect(reverse('product_list'))


	# def get_order(request):
	# 	if request.method == 'POST':
	# 		form=customer_form(request.POST)
	# 		if form.is_valid():
	# 			name=form.cleaned_data.get("firstname")
	# 			contact=form.cleaned_data.get("contact")
	# 			size=form.cleaned_data.get("size")
	# 			product=form.cleaned_data.get("product")

	# 			print name

	# 			# new_customer, created=Customer.objects.get_or_create(firstname=name,contact=contact, size=size,product=product)


	# 			return HttpResponseRedirect("/")




def latest(request):
	recent = timezone.now() - timedelta(days=7)
	latest=Product.objects.filter(entry_date__gte=recent)
	#show with product images
	context ={ 'latest' : latest }
	return render(request,'stock/latest.html',context)

def trousers(request):
	category_trousers=Category.objects.filter(title='trousers')
	trousers=Product.objects.filter(category=category_trousers)

	context={'trousers': trousers }
	return render(request,'stock/trousers.html', context)

def shoes(request):
	category_shoes=Category.objects.filter(title='shoes')
	shoes=Product.objects.filter(category=category_shoes)

	context={'shoes': shoes }
	return render(request,'stock/shoes.html', context)

def shirts(request):
	category_shirts=Category.objects.filter(title='shirts')
	shirts=Product.objects.filter(category=category_shirts)

	context={'shirts': shirts }
	return render(request,'stock/shirts.html', context)

def caps(request):
	category_caps=Category.objects.filter(title='caps and others')
	caps=Product.objects.filter(category=category_caps)

	context={'caps': caps }
	return render(request,'stock/caps.html', context)

class ProductDetail(FormMixin,DetailView):
	model=Product
	template_name="stock/product_detail.html"
	form_class=CustomerForm

	def get_context_data(self,*args,**kwargs):
		context=super(ProductDetail, self).get_context_data(*args,**kwargs)
		instance=self.get_object()
		# object=self.get_object()
		context["related"]=Product.objects.related_products(instance)
		context["form"]=self.get_form()
		return context

	def post(self,request,*args,**kwargs):
		self.object=self.get_object()
		form=self.get_form()
		# created=datetime.now()
		# initial={'size': self.object.size, 'product': self.object.name}
		if form.is_valid():
			contact=form.cleaned_data.get('contact')
			size=form.cleaned_data.get('size')
			product=form.cleaned_data.get('product')
			name=form.cleaned_data.get('firstname')

			customer,created=Customer.objects.get_or_create(firstname=name,contact=contact,size=size, product=product)
			return self.form_valid(form)
		else:
			return self.form_invalid(form)

	def get_success_url(self):
		return reverse('product_list')

class CheckoutView(SingleObjectMixin,View):
	model=Checkout

	def get(self,request,*args,**kwargs):
		object=self.get_object()
		name=self.request.Get.get('name')
		size=self.request.Get.get('size')
		price=self.request.Get.get('price')
		contace=self.request.Get.get('contact')
		quantity=self.request.Get.get('quantity')

	

# class UploadView(FormView):
# 	#model=ProductImage
# 	template_name='stock/image_upload.html'
# 	form_class=ImageUpload

# 	def form_valid(self,form):
# 		form=self.get_form()
# 		form.save()
# 		return super(UploadView,self).form_valid(form)

# 	def get_success_url(self):
# 		return reverse('upload')









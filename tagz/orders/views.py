from django.http import Http404
from django.contrib import messages
from django.shortcuts import render,redirect
from django.views.generic.edit import FormView,CreateView
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.core.urlresolvers import reverse
from .forms import AddressForm,UserAddressForm
from .mixins import CartOrderMixin,LoginRequiredMixin
from .models import UserAddress,Order,GuestCheckout, Order
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.
class OrderDetail(DetailView):
	model=Order

	def dispatch(self,request,*args,**kwargs):
		try:
			guest_checkout_id=self.request.session.get('guest_checkout_id')
			user=GuestCheckout.objects.get(id=guest_checkout_id)
		except GuestCheckout.DoesNotExist:
			user=GuestCheckout.objects.get(user=request.user)
		except:
			user=None
		obj=self.get_object()
		if obj.user==user and user is not None:
			return super(OrderDetail,self).dispatch(request,*args,**kwargs)
		else:
			raise Http404



class OrderList(LoginRequiredMixin,ListView):
	template_name="orders/order_list.html"
	queryset=Order.objects.all()

	def get_queryset(self):
		try:
			guest_checkout_id=self.request.user.id
			user=GuestCheckout.objects.get(id=guest_checkout_id)
		except GuestCheckout.DoesNotExist:
			user=GuestCheckout.objects.get(user=self.request.user)
			return super(OrderList,self).get_queryset().filter(user=user)


class UserAddressCreateView(CreateView): 
	# login_url='/accounts/login/'
	# redirect_field_name = 'redirect_to'
	form_class=UserAddressForm
	template_name='orders/address_create.html'
	success_url="/checkout/address/"

	def get_checkout_user(self):
		guest_checkout_id=self.request.session.get('guest_checkout_id')
		user=GuestCheckout.objects.get(id=guest_checkout_id)
		return user

	def form_valid(self,form,*args,**kwargs):
		form.instance.user=self.get_checkout_user()

		return super(UserAddressCreateView,self).form_valid(form,*args,**kwargs)

	def get_success_url(self,*args,**kwargs):
		return reverse('order_address')

class AddressView(CartOrderMixin,FormView):
	form_class=AddressForm
	template_name="orders/address_select.html"

	def dispatch(self,*args,**kwargs): #automatically in all the views, knows where to take every request
		b_address, s_address=self.get_addresses()

		if b_address.count() == 0:
			messages.success(self.request, "please add a billing address")
			return redirect('user_address')
		elif s_address.count() == 0:
		 	messages.success(self.request, "please add a shipping address")
			return redirect('user_address')
		else:
			return super(AddressView,self).dispatch(*args,**kwargs) #return original implementation

	def get_addresses(self,*args,**kwargs):
		guest_checkout_id=self.request.session.get('guest_checkout_id')
		user=GuestCheckout.objects.get(id=guest_checkout_id)
		b_address=UserAddress.objects.filter(
				user=user, #self.request.user.email
				type='billing',
				)
		s_address=UserAddress.objects.filter(
				user=user,
				type='shipping',
				)
		return b_address, s_address


#change the queryset that goes to each field
	def get_form(self,*args,**kwargs):
		form=super(AddressView,self).get_form(*args,**kwargs)
		b_address, s_address=self.get_addresses()

		#get the fields and update them
		form.fields['billing_address'].queryset = b_address
		form.fields['shipping_address'].queryset = s_address
		return form

	def form_valid(self,form,*args,**kwargs):
		#set sessions staff
		#form.instance.user=self.get_checkout_user()
		billing_address=form.cleaned_data["billing_address"]
		shipping_address=form.cleaned_data["shipping_address"]
		order=self.get_order() #added
		order.billing_address=billing_address
		order.shipping_address=shipping_address
		order.save()
		# self.request.session['billing_address_id']=billing_address.id  #commented
		# self.request.session['shipping_address_id']=shipping_address.id
		return super(AddressView,self).form_valid(form,*args,**kwargs)

	def get_success_url(self,*args,**kwargs):
		return reverse('checkout')

#


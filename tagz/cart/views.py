import braintree
import django_pesapal
from django.conf import settings
from django_pesapal.views import PaymentRequestMixin
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.views.generic.base import View
from django.http import HttpResponseRedirect, Http404, JsonResponse
from django.shortcuts import get_object_or_404, redirect,render
from django.views.generic.detail import SingleObjectMixin,DetailView
from django.views.generic.edit import FormMixin

from stock.models import Variation
from cart.models import Cart,CartItem
from orders.forms import GuestCheckoutForm
from orders.mixins import CartOrderMixin
from orders.models import GuestCheckout,Order,UserAddress

from django.conf import settings


if settings.DEBUG:
	braintree.Configuration.configure(braintree.Environment.Sandbox,
		merchant_id=settings.BRAINTREE_MERCHANT_ID,
		public_key=settings.BRAINTREE_PUBLIC,
		private_key=settings.BRAINTREE_PRIVATE,
	)


class ItemCountView(View):
	def get(self,request,*args,**kwargs):
		if request.is_ajax():
			cart_id=self.request.session.get("cart_id")

			if cart_id == None:
				count=0
			else:
				cart=Cart.objects.get(id=cart_id)
				count=cart.item.count()
			request.session["cart_item_count"]= count
			return JsonResponse({'count': count })
		else:
			return Http404


class CartView(SingleObjectMixin,View):
	model=Cart
	template_name="cart/view.html"

	def get_object(self,*args,**kwargs):
		self.request.session.set_expiry(0)
		cart_id=self.request.session.get("cart_id")
		if cart_id == None:
			new_cart=Cart()
			new_cart.save()
			cart_id=new_cart.id
			self.request.session["cart_id"]=cart_id
		cart=Cart.objects.get(id=cart_id)
		if self.request.user.is_authenticated():
			cart.user=self.request.user
			cart.save()
		return cart

	def get(self,request,*args,**kwargs):
		cart=self.get_object()
		item_id=request.GET.get("item") #variation id
		delete_item=request.GET.get("delete", False)
		flash_message=""
		item_added=False
		if item_id:
			item_instance=get_object_or_404(Variation,id=item_id)
			qty=request.GET.get("qty",1)
			# cart=Cart.objects.all()[0]
			try:
				if int(qty) < 1:
					delete_item=True
			except:
				raise Http404
			cart_item, created= CartItem.objects.get_or_create(cart=cart,item=item_instance)
			if created:
				flash_message="item added to the cart"
				item_added=True
			# 	item_added=True
			if delete_item:
				flash_message="Item removed from cart" 
				cart_item.delete()
			else:
				if not created:
					flash_message="quantity updated successfully"
				cart_item.quantity = qty
				# messages.success(request,'Item updated successfully')
				cart_item.save()
			if not request.is_ajax():
				return HttpResponseRedirect(reverse('cart'))
				# return cart_item.cart.get_absolute_url()
				
		if request.is_ajax():
			try:
				total=cart_item.line_item_total
			except:
				total=None
			try:
				subtotal=cart_item.cart.subtotal
			except:
				subtotal=None
			try:
				cart_total=cart_item.cart.total
			except:
				cart_total=None
			try:
				total_items=cart_item.cart.item.count()
			except:
				total_items=None
			data={
				"deleted": delete_item,
				"item_added": item_added,
				"line_total": total,
				"cart_total": cart_total,
				"total_items": total_items,
				"subtotal": subtotal,
				"flash_message": flash_message,
				}

			return JsonResponse(data)

		context = { "object": self.get_object() }
		template = self.template_name
		return render(request,template,context)




class CheckoutView(CartOrderMixin,FormMixin,DetailView):
	model=Cart
	template_name="cart/checkout.html"
	form_class=GuestCheckoutForm

	# def get_order(self,*args,**kwargs):
	# 	cart=self.get_object()
	# 	new_order_id=self.request.session.get('order_id')
	# 	if new_order_id is None:
	# 		new_order=Order.objects.create(cart=cart)
	# 		self.request.session['order_id']=new_order.id
	# 	else:
	# 		new_order=Order.objects.get(id=new_order_id)
	# 	return new_order


	def get_object(self,*args,**kwargs):
		# cart_id=self.request.session.get("cart_id")
		cart=self.get_cart()
		if cart == None:
			return None
		# if cart_id == None:
			# return redirect("cart")
		# cart=Cart.objects.get(id=cart_id)
		return cart

	def get_context_data(self,*args,**kwargs): #users should continue even if not logged in or registered as users
		context=super(CheckoutView,self).get_context_data(*args,**kwargs)

		user_auth=False
		guest_checkout_id=self.request.session.get('guest_checkout_id')
		# if not self.request.user.is_authenticated() or guest_checkout_id == None:
			
		# elif self.request.user.is_authenticated() or guest_checkout_id != None:
		# 	user_auth=True
		# else:
		# 	pass
		if self.request.user.is_authenticated():
			guest_checkout,created=GuestCheckout.objects.get_or_create(email=self.request.user.email)
			guest_checkout.user=self.request.user
			guest_checkout.save()
			context["client_token"]=guest_checkout.get_client_token()
			self.request.session['guest_checkout_id']=guest_checkout.id
		elif not self.request.user.is_authenticated() and guest_checkout_id == None:
			context['login_form']=AuthenticationForm()
			context['next_url']= self.request.build_absolute_uri()
		else:
			pass
		if guest_checkout_id != None:
			user_auth=True
			if not self.request.user.is_authenticated(): #guest
				guest_checkout_2= GuestCheckout.objects.get(id=guest_checkout_id)
				context["client_token"]=guest_checkout_2.get_client_token()

		if self.get_object() is not None:
			context['order']=self.get_order()	
		context['user_auth']=user_auth
		context['form']=self.get_form()
		return context
#handle post data
	def post(self,request,*args,**kwargs):
		self.object=self.get_object()
		form=self.get_form()
		if form.is_valid():
			email=form.cleaned_data.get('email')
			guest_checkout, created=GuestCheckout.objects.get_or_create(email=email)
			request.session["guest_checkout_id"]=guest_checkout.id #grab the mail and associate the order later
			return self.form_valid(form)
		else:
			return self.form_invalid(form)

	def get_success_url(self):
		return reverse('checkout')


	def get(self,request,*args,**kwargs):
		get_data=super(CheckoutView,self).get(request,*args,**kwargs)
		cart=self.get_object()
		if cart==None:
			return redirect("cart")
		new_order=self.get_order()
		guest_checkout_id=request.session.get('guest_checkout_id')
		if guest_checkout_id != None:
		# if request.session.get('guest_checkout_id') != None:
			guest_checkout=GuestCheckout.objects.get(id=guest_checkout_id)
			if new_order.billing_address == None or new_order.shipping_address == None: #added
				return redirect('order_address') #added
			# billing_address_id=request.session.get('billing_address_id') #commented
			# shipping_address_id=request.session.get('shipping_address_id') #commented

			# user=guest_checkout
		# billing_address_id=request.session.get('billing_address_id')
		# shipping_address_id=request.session.get('shipping_address_id')

			# if billing_address_id == None or shipping_address_id == None: #commented
				# return redirect('order_address') #commented 
			# else: #comented
			# 	billing_address=UserAddress.objects.get(id=billing_address_id) #commented
			# 	shipping_address=UserAddress.objects.get(id=shipping_address_id) #commented

			new_order.user=guest_checkout
			# new_order.billing_address=billing_address #commented n below one
			# new_order.shipping_address=shipping_address
			new_order.save()
		return get_data

class PaymentView(PaymentRequestMixin):
	def get_pesapal_payment_iframe(self):
		#authenticate with pesapal to get the payment iframe src
		order_info={
			'first_name': 'Some',
            'last_name': 'User',
            'amount': 100,
            'description': 'Payment for X',
            'reference': 2,  # some object id
            'email': 'user@example.com',
		}
		iframe_src_url = self.get_payment_url(**order_info)
		return iframe_src_url

class CheckoutFinalView(CheckoutView,View):
	def post(self,request,*args,**kwargs):
		order=self.get_order()
		order_total=order.order_total
		nonce = request.POST.get("payment_method_nonce")
		if nonce:
			result = braintree.Transaction.sale({
	    		"amount": order_total,
	    		"payment_method_nonce": nonce,
	    		"billing": {
	    			"postal_code":"%s" % (order.billing_address.postal_code)
	    		},
	    		"options": {
	        		"submit_for_settlement": True
	    		}
			})
			if result.is_success:
				# order.order_id=result.transaction.id
				order.mark_completed(order_id=result.transaction.id)
				messages.success(request,"Thank you for your order")
				del request.session['cart_id']
				del request.session['order_id']
			else:
				messages.success(request,"There is a problem processing your order")
				return redirect("checkout")
		# if request.POST.get("payment-token") == "abc":
		# 	#print order.cart.item.all()
		# 	order.mark_completed()
		# 	messages.success(request,"Thank you for your order")
		# 	del request.session['cart_id']
		# 	del request.session['order_id']
		return redirect('order_detail',pk=order.pk)

	def get(self,request,*args,**kwargs):

		return redirect('order_detail',pk=order.pk)
from django import forms
from .models import ProductImage,Product,Checkout,Customer
from django.core.mail import send_mail, BadHeaderError
from django.http import HttpResponse, HttpResponseRedirect
from django.forms.widgets import HiddenInput

class ImageUpload(forms.ModelForm):
	class Meta:
		model=ProductImage
		fields= [
			"product",
			"image",
		]

# class Checkout(forms.ModelForm):
# 	model=Checkout
# 	class Meta:
# 		model=Checkout
# 		fields=[
# 			'quantity',
# 			'contact'
# 		]

# 	quantity=forms.IntegerField(label="enter quantity")
# 	contact=forms.CharField(max_length=20, label="07xx")

class CustomerForm(forms.Form):
	firstname=forms.CharField(max_length=20, required=True,help_text="your name")
	contact=forms.IntegerField(required=True,help_text="07xx")
	size=forms.CharField(max_length=10, widget=forms.HiddenInput())
	product=forms.CharField(max_length=20,widget=forms.HiddenInput())
	class Meta:
		help_texts = {
			'firstname': ("enter your name"),
			'contact': ("Phone number")
		}
		widgets = {
			'product': forms.HiddenInput(),
			'size': forms.HiddenInput(),
		}


	


	


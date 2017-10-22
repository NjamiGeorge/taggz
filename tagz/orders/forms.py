from django import forms
from django.contrib.auth import get_user_model
from .models import UserAddress

User=get_user_model()

class GuestCheckoutForm(forms.Form):
	email=forms.EmailField()
	email2=forms.EmailField(label='confirm email')

	def clean_email2(self):
		email=self.cleaned_data.get('email')
		email2=self.cleaned_data.get('email2')

		if email == email2:
			user_exists=User.objects.filter(email=email).count()
			if user_exists != 0:
				raise forms.ValidationError("user exists. login instead")
			return email2
		else:
			raise forms.ValidationError('please confirm emails match')
		


class AddressForm(forms.Form):
	shipping_address=forms.ModelChoiceField( #allows us to have choices based on the model
		queryset=UserAddress.objects.filter(type='billing'), 
		# widget=forms.RadioSelect,
		empty_label=None
		)
	billing_address=forms.ModelChoiceField(
		queryset=UserAddress.objects.filter(type='shipping'),
		# widget=forms.RadioSelect,
		empty_label=None
		)

class UserAddressForm(forms.ModelForm):
	class Meta:
		model=UserAddress
		fields=[
			'city',
			'street',
			'type',
			'phone',
			'postal_code',
			'post_address'

		]
		labels = {
			'street':'location/landmark'
		}
	# 	widgets = {
	# 		'type':forms.RadioSelect,
	# 	}
	# def __init__(self,*args,**kwargs):
	# 	super(UserAddressForm, self).__init__(*args,**kwargs)
	# 	self.fields['type'].empty_label= 'please select'



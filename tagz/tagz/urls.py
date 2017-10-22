"""tagz URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from stock.views import ListProducts,ProductDetail,latest, trousers, shirts, caps, get_customer, shoes
from cart.views import CartView, CheckoutView,CheckoutFinalView, ItemCountView
from orders.views import AddressView, UserAddressCreateView,OrderList,OrderDetail

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^payments/', include('django_pesapal.urls')),
    url(r'^products', ListProducts.as_view(), name='product_list'),
    url(r'^customer/$',get_customer, name='customer'),
    url(r'^items/(?P<pk>\d+)/$', ProductDetail.as_view(), name='product_detail'),
    # url(r'^upload/$', UploadView.as_view(), name='upload'),    
    # url(r'^contact/$', ContactView.as_view(), name='contact'), 
    # url(r'^checkout/', CheckoutView.as_view(), name='checkout'),
    url(r'^arrivals/$', latest, name='latest'),
    url(r'^trousers/$', trousers, name='trousers'),
    url(r'^shoes/$', shoes, name='shoes'),
    url(r'^shirts/$', shirts, name='shirts'),
    url(r'^caps/$', caps, name='caps'),
    url(r'^accounts/', include('registration.backends.default.urls')),
    url(r'^orders/$', OrderList.as_view(), name='orders'),
    url(r'^order/(?P<pk>\d+)/$', OrderDetail.as_view(), name='order_detail'),
    url(r'^cart/$', CartView.as_view(), name='cart'),
    url(r'^cart/count/$', ItemCountView.as_view(), name='item_count'),
    url(r'^checkout/$',CheckoutView.as_view(),name='checkout'),
    # url(r'^customerform/$',CustomerForm.as_view(),name='customer_form')
    url(r'^checkout/address/$', AddressView.as_view(), name='order_address'),
    url(r'^checkout/address/add/$', UserAddressCreateView.as_view(), name='user_address'),
    url(r'^checkout/final/$', CheckoutFinalView.as_view(), name='checkout_final'),


    



]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
"""
URL configuration for portafolio_app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

# HABILITAR LOS DEMÁS MODEL DE DJANGO EN EL ADMIN
from django.contrib import admin
from .views import carts 
from .views import sellproducts
from .views import transbank_pay
from .views import login
from .views import logout
from .views import views
from .views import registries


# ADD MODEL IN ADMIN


urlpatterns = [
    path('', login.load),   
    path('admin/', admin.site.urls),
    path('carts', carts.load),
    path('sell-products', sellproducts.load, name='sell-products'),
    #path('', sellproducts.load),
    path('webpay-plus-create', transbank_pay.load,),
    path('commit-pay', transbank_pay.commitpay),
    path('login', login.load),
    path('logout', logout.load),
    path('service', view=views.service, name='service'),  
    path('about', view=views.about, name='about'),  
    path('contact', view=views.contact, name='contact'),  
    path('team', view=views.team, name='team'), 
    path('index', view=views.index, name='index'),
    path('calendario', view=views.calendario, name='calendario'),
]

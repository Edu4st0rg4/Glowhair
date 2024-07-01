import random
from django.shortcuts import render
from portafolio_app.db.models import Products, Cart, ShoppingSession, Customers, AuthUser
from django.contrib.auth.models import User
from datetime import datetime
import traceback, json
from django.core.serializers import serialize
from django.http import JsonResponse
from .carts import load_cart
from django.contrib.auth.decorators import login_required


@login_required
def load(request):
    print('page building')
    products = []
    quantities = 0
    try:
        products = Products.objects.all()
        user_id = request.user.id
        user = AuthUser.objects.get(pk=user_id)
        print(f'{user}')
        customer = Customers.objects.get(user=user)
        print(f'{customer}')
        carts, quantities, total, products_cart = load_cart(customer_id=customer.id)
        request.session['customer_id'] = customer.id
        try:
            print('Agregar productos al carro de compras.')
            product_id = request.GET.get('product_id')
            print(f'product_id: {product_id}')
            product = Products.objects.get(pk=product_id)
            print('find product')
            is_not_exist = True
            for cart in carts:
                if cart.products.name == product.name:
                    cart.quantity = cart.quantity + 1
                    cart.save(force_update=True)
                    is_not_exist = False
            if is_not_exist:
                cart = Cart()
                cart.shopping_session = load_shopping_session(customer_id=customer.id)
                cart.price = product.sale_price
                cart.quantity = 1
                cart.products = product
                cart.save()
            carts, quantities, total, products_cart = load_cart(customer_id=customer.id)
        except Exception as ex:
            print('No agregar productos al carro de compras.')
    except Exception as ex:
        print('Error: al cargar los datos')
    return render(request, 'sell-products.html', {'products': products, 'quantities': quantities})

def load_shopping_session(customer_id:int=None):
    print('load_shopping_session')
    try:
        print(f'customer_id: {customer_id}')
        customer = Customers.objects.get(pk=customer_id)
        shopping_session = ShoppingSession.objects.get(customers=customer)
        return shopping_session
    except ShoppingSession.DoesNotExist as ex:
        print('Session no encontrada: se procede con su creación.')
        shopping_session = ShoppingSession()
        shopping_session.customers = customer
        shopping_session.create_at = datetime.now()
        shopping_session.state = 1
        shopping_session.save()
        return shopping_session
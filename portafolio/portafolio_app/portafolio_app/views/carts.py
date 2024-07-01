import random
from django.shortcuts import render
from portafolio_app.db.models import Products, ShoppingSession, Cart,Customers
import traceback
from django.contrib.auth.decorators import login_required

@login_required
def load(request):
    print('page building')
    carts = []
    products =[]
    buy_order = str(random.randrange(1000000, 99999999))
    quantities = 0
    total = 0
    session_id = ''  
    try: 
        customer_id = request.session['customer_id']
        print(f'customer_id: {customer_id}')
        session_id = customer_id
        carts, quantities, total, products = load_cart(customer_id=customer_id)
    except Exception as ex:
        print(f'Error: {ex}')
        traceback.print_exc() 

    return render(request, 'carts.html', {'products': products, 'quantities': quantities, 'total': total, 'buy_order': buy_order, 'session_id': session_id})

def load_cart(customer_id:int=None):
    carts = []
    products = []
    quantities = 0
    total = 0
    try: 
        print(f'customer_id: {customer_id}')
        customer = Customers.objects.get(pk=customer_id)
        print('load carts')
        shopping_session = ShoppingSession.objects.get(customers=customer)
        carts = Cart.objects.filter(shopping_session=shopping_session)
        for cart in carts:
            product = {
                'name': cart.products.name,
                'description': cart.products.description,
                'quantity': cart.quantity,
                'image': cart.products.image,
                'sale_price': cart.products.sale_price,
                'total': cart.quantity*cart.products.sale_price
            }
            products.append(product)
            quantities = quantities + int(cart.quantity)
            total = total + cart.quantity*cart.products.sale_price
    except Exception as ex:
        print(f'Error: {ex}')
        traceback.print_exc()
    print(f'carts: {carts}')
    print(f'products: {products}')
    print(f'quantities: {quantities}')
    print(f'total: {total}')
    return carts, quantities, total, products
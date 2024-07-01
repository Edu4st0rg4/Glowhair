import traceback, os, requests
# IMPORT LIBRARY URL DOMAIN
from urllib.parse import urlparse
from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import datetime as dt
from .carts import load_cart
from django.contrib.auth.decorators import login_required

@login_required
def load(request):
    print('METHOD', request.method)

    if  request.method == 'POST':

        buy_order = request.POST.get('buy_order')
        session_id = request.POST.get('session_id') # SESSION ID USER
        amount = request.POST.get('amount')
        return_url = 'http://localhost:8000/commit-pay'

        body = {
            "buy_order": buy_order,
            "session_id": session_id,
            "amount": amount,
            "return_url": return_url
            }                        
        response = transbank_create(body)
        print(f'response.status_code: {response.status_code}')        
        if response.status_code == 200 :
            json_response = response.json()
            print('response: ', json_response)
            token = json_response['token']
            print(f'token: ', token)
            url = json_response['url']
            print(f'url: ', url)
            return render(request,'send-pay.html', {'token' : token, 'url': url, 'amount': amount})
        else: 
            HttpResponse("Error transacción transbank")
    return HttpResponse("Error transacción transbank")


# MÉTODO QUE CREA LA CABECERA SOLICITADA POR TRANSBANK EN UN REQUEST (SOLICITUD)
def header_request_transbank():
    headers = { # DEFINICIÓN TIPO DE AUTORIZACIÓN Y AUTENTICACIÓN
                "Authorization": "Token",
                # LLAVE QUE DEBE SER MODIFICADA PORQUE ES SOLO DEL AMBIENTE DE INTEGRACIÓN DE TRANSBANK (PRUEBAS)
                "Tbk-Api-Key-Id": "597055555532",
                # LLAVE QUE DEBE SER MODIFICADA PORQUE DEL AMBIENTE DE INTEGRACIÓN DE TRANSBANK (PRUEBAS)
                "Tbk-Api-Key-Secret": "579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C",
                # DEFINICIÓN DEL TIPO DE INFORMACIÓN ENVIADA
                "Content-Type": "application/json",
                # DEFINICIÓN DE RECURSOS COMPARTIDOS ENTRE DISTINTOS SERVIDORES PARA CUALQUIER MÁQUINA
                "Access-Control-Allow-Origin": "*",
                'Referrer-Policy': 'origin-when-cross-origin',
                } 
    return headers

def transbank_create(data):
    # CABECERA SOLICITADA POR TRANSBANK
    headers = header_request_transbank()
    # LECTURA DE PAYLOAD (BODY) CON INFORMACIÓN DE TIPO JSON
    print(f'headers: {headers}')
    print(f'data: {data}')
    # DEFINICIÓN DE URL DE TRANSBANK PARA CREAR UNA TRANSACCIÓN
    url = "https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions"
    print(f'url: {url}')
    # INVOCACIÓN POR POST A API REST QUE CREA UNA TRANSACCIÓN EN TRANSBANK
    response = requests.post(url=url, json=data, headers=headers)
    # RETORNO DE LA RESPUESTA DE TRANSBANK
    return response

# DEFINICIÓN DE RUTA API REST CON UN PARAMETRO DE ENTRADA (tokenws) EN EL PATH, PERMITIENDO SOLO SER LLAMADO POR GET
def transbank_commit(tokenws):
    print('tokenws: ', tokenws)
    # DEFINICIÓN DE URL DE TRANSBANK PARA CONFIRMAR UNA TRANSACCIÓN
    url = "https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions/{0}".format(tokenws)
    # CABECERA SOLICITADA POR TRANSBANK
    headers = header_request_transbank()
    # INVOCACIÓN POR GET A API REST QUE CONFIRMA UNA TRANSACCIÓN EN TRANSBANK    
    response = requests.put(url, headers=headers)
    print('response: ', response.json())
    # RETORNO DE LA RESPUESTA DE TRANSBANK
    return response.json()

# DEFINICIÓN DE RUTA API REST CON UN PARAMETRO DE ENTRADA (tokenws, amount) EN EL PATH, PERMITIENDO SOLO SER LLAMADO POR POST
def transbank_reverse_or_cancel(tokenws:str="", amount:int=None):
    print('tokenws: ', tokenws)
    # LECTURA DE PAYLOAD (BODY) CON INFORMACIÓN DE TIPO JSON
    data = {
            "amount": amount
            }
    print('data: ', data)
    # DEFINICIÓN DE URL DE TRANSBANK PARA CONFIRMAR UNA TRANSACCIÓN
    url = "https://webpay3gint.transbank.cl/rswebpaytransaction/api/webpay/v1.2/transactions/{0}/refunds".format(tokenws)
    # CABECERA SOLICITADA POR TRANSBANK
    headers = header_request_transbank()
    # INVOCACIÓN POR GET A API REST QUE CONFIRMA UNA TRANSACCIÓN EN TRANSBANK    
    response = requests.post(url, json = data, headers=headers)
    print('response: ', response.json())
    # RETORNO DE LA RESPUESTA DE TRANSBANK
    return response.json() 


@csrf_exempt 
def commitpay(request):
    print('commitpay')
    if request.method == 'GET':
        tokenws = request.GET.get('token_ws')    
    elif request. method == 'POST':
        tokenws = request.POST.get('token_ws')
    #TRANSACCIÓN REALIZADA
    if tokenws is not None:

        #APROBAR TRANSACCIÓN
        response = transbank_commit(tokenws)
        print("response: {}".format(response)) 

        status = response['status']
        print("status: {0}".format(status))
        response_code = response['response_code']
        print("response_code: {0}".format(response_code)) 
        #TRANSACCIÓN APROBADA
        if status == 'AUTHORIZED' and response_code == 0:

            state = ''
            if status == 'AUTHORIZED':
                state = 'ACEPTADO'
            pay_type = ''
            if response['payment_type_code'] == 'VD':
                pay_type = 'Tarjeta de Débito'
            if response['payment_type_code'] == 'VC':
                pay_type = 'Tarjeta de Crédito'
            amount = int(response['amount'])
            amount = f'{amount:,.0f}'.replace(',', '.')
            transaction_date = dt.datetime.strptime(response['transaction_date'], '%Y-%m-%dT%H:%M:%S.%fZ')
            transaction_date = '{:%d-%m-%Y %H:%M:%S}'.format(transaction_date)
            transaction_detail = {  'card_number': response['card_detail']['card_number'],
                                    'transaction_date': transaction_date,
                                    'state': state,
                                    'pay_type': pay_type,
                                    'amount': amount,
                                    'authorization_code': response['authorization_code'],
                                    'buy_order': response['buy_order'], }
            
            carts, quantities, total, products_cart = load_cart(customer_id=int(response['session_id']))
            
            for cart in carts:
                cart.delete()
            carts, quantities, total, products_cart = load_cart(customer_id=int(response['session_id']))
            return render(request, 'commit-pay.html', {'transaction_detail': transaction_detail, 'quantities': quantities})
        else:
            #TRANSACCIÓN RECHAZADA
            state = ''
            if status == 'FAILED':
                state = 'RECHAZADO'            
            if response['payment_type_code'] == 'VD':
                pay_type = 'Tarjeta de Débito'
            if response['payment_type_code'] == 'VC':
                pay_type = 'Tarjeta de Crédito'            
            amount = int(response['amount'])
            amount = f'{amount:,.0f}'.replace(',', '.')
            #response = transbank_reverse_or_cancel(tokenws=tokenws, amount=amount)
            print(f'response: {response}')
            transaction_date = dt.datetime.strptime(response['transaction_date'], '%Y-%m-%dT%H:%M:%S.%fZ')
            transaction_date = '{:%d-%m-%Y %H:%M:%S}'.format(transaction_date)
            transaction_detail = {  'card_number': response['card_detail']['card_number'],
                                    'transaction_date': transaction_date,
                                    'state': state,
                                    'pay_type': pay_type,
                                    'amount': amount,
                                    'authorization_code': response['authorization_code'],
                                    'buy_order': response['buy_order'], }
            carts, quantities, total, products_cart = load_cart(customer_id=int(response['session_id']))                              
            return render(request, 'commit-pay.html', {'transaction_detail': transaction_detail, 'quantities': quantities})
    else:
    #TRANSACCIÓN CANCELADA            
        return HttpResponse('ERROR EN LA TRANSACCIÓN, SE CANCELO EL PAGO.')
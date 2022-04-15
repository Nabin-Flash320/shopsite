import re
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from shop.models import Products, Cart
from django.contrib.auth.forms import AuthenticationForm
from django.views.decorators.csrf import csrf_exempt
import itertools

# Create your views here.

def index(request):
    if request.user.is_authenticated:
        return redirect('shop.activities')
    return redirect('user.login')

def login_request(request):
    if request.method == 'POST':
        login_form = AuthenticationForm(request=request, data=request.POST)
        if login_form.is_valid():
            username = login_form.cleaned_data.get('username')
            password = login_form.cleaned_data.get('password')
            user = authenticate(username=username, password=password) 
            if user is not None:
                login(request, user)
                return redirect('shop.activities' )  
    login_form = AuthenticationForm()
    return render(request=request, template_name='login.html', context={"login_form": login_form})

def logout_request(request):
    logout(request)
    return redirect('user.login')

def activities(request):
    if request.user.is_authenticated:
        return render(request=request, template_name='activities.html')
    return redirect('user.login')

def product_data(request):
    if request.user.is_authenticated:
        cart_datas = list(Cart.objects.all().values())
        cart_data = dict()
        completed_signal = dict()
        for data in cart_datas:
            if data['cart_id'] in cart_data.keys():
                cart_data[data['cart_id']].update(dict([(data['product_id'], data['product_count'])]))
            else:
                cart_data[data['cart_id']] = dict([(data['product_id'], data['product_count'])])

        for data in cart_datas:
            if data['cart_id'] in completed_signal.keys():
                continue
            else:
                completed_signal[data['cart_id']] = data['completed']
        datas = {
            'product_details' : list(Products.objects.all().values()),
            'cart_details': cart_data,
            'task_status': completed_signal,
        }
        return JsonResponse(datas)
    else: redirect('user.login')

@csrf_exempt
def completed(request, cart_id):
    if request.method == 'POST':
        datas = list(Cart.objects.filter(cart_id=cart_id).values())
        print('Inside the completed route!!')
        if request.POST['completed']:
            for data in datas:
                cart = Cart(key=data['key'], cart_id=data['cart_id'], product_id=data['product_id'], product_count=data['product_count'], completed=True)
                cart.save()
        return JsonResponse({
            'done': 'Sent request!!'
        })
    return JsonResponse({
        'Error': 'Somethind went wrong!!'
    })

@csrf_exempt
def verify_completion(request, id):
    if request.method == 'POST' and request.user.is_authenticated:
        datas = list(Cart.objects.filter(cart_id=id).values())
        for data in datas:
            cart = Cart(key=data['key'], cart_id=data['cart_id'], product_id=data['product_id'], product_count=data['product_count'], completed=False)
            cart.save()
        return JsonResponse({
            'verified': True
        })
    return JsonResponse({
        'Error': 'Somethind went wrong!!'
    })

@csrf_exempt
def send_data_to_cart(request, cart_id):
    if request.method == 'POST':
        datas = Cart.objects.filter(cart_id=cart_id).values()
        # If any of the cart's data is not availabe in the database, then it is created.
        if not datas:
            keys = list(itertools.chain(*list(Cart.objects.all().values_list('key'))))
            cart = Cart(key=max(keys)+1, cart_id=cart_id, product_id=request.POST['product_id'], product_count=1)
            cart.save()
        else:
            product_datas = list(Cart.objects.filter(cart_id=cart_id).filter(product_id=request.POST['product_id']))
            # If any of the product data is not available in the database for the given cart, then it is created!!
            if not product_datas:
                keys = list(itertools.chain(*list(Cart.objects.all().values_list('key'))))
                cart = Cart(key=max(keys)+1, cart_id=cart_id, product_id=request.POST['product_id'], product_count=1)
                cart.save()
            # If everython is 'OK', the proceed to update the count of the product.
            else: 
                product_values = list(Cart.objects.filter(cart_id=cart_id).filter(product_id=request.POST['product_id']).values())[0]
                count = product_values['product_count'] + int(request.POST['count'])
                if count == 0:
                    Cart.objects.filter(cart_id=cart_id).filter(product_id=request.POST['product_id']).delete()
                else:
                    cart = Cart(key=product_values['key'], cart_id=product_values['cart_id'], product_id=product_values['product_id'], product_count=count)
                    cart.save()
        return JsonResponse(list(Cart.objects.filter(cart_id=cart_id).values()), safe=False)
    return JsonResponse([list(Products.objects.all().values()), list(Cart.objects.filter(cart_id=cart_id).values())], safe=False)



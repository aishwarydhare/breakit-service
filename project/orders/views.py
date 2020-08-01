from datetime import datetime, timedelta

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.auth_decorator import authenticate
from customers.models import Customer
from mealset.models import MealSet
from miscellaneous.logging_utils import show_error
from orders.choices import OrderStatusChoices
from orders.models import Order, active_order_statuses, ENDTIME_THRESHOLD
from restaurants.models import FoodItem, AddOn


@api_view(['POST'])
@authenticate
def todays_order(request):
    try:
        customer = request.user.customer
        dt_now = datetime.now()
        m = MealSet.objects.filter(delivery_date=dt_now.date())
        if m.exists():
            o = Order.objects.filter(customer=customer, mealset__in=m)
            if o.exists():
                return Response({
                    "ok": True,
                    "data": o[0].in_dict()
                }, status=status.HTTP_200_OK)
        return Response({
            "ok": True,
            "data": None
        }, status=status.HTTP_200_OK)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except MealSet.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def next_booking(request):
    try:
        customer = request.user.customer
        dt_now = datetime.now()
        m = MealSet.objects.filter(delivery_date__gte=dt_now.date() + timedelta(days=1))
        if m.exists():
            o = Order.objects.filter(customer=customer, mealset__in=m, status__in=active_order_statuses)
            if o.exists():
                return Response({
                    "ok": True,
                    "data": o[0].in_dict()
                }, status=status.HTTP_200_OK)
        return Response({
            "ok": True,
            "data": None
        }, status=status.HTTP_200_OK)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except MealSet.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def place_order(request):
    try:
        result = _process_order(request)

        if result == -1:
            return Response("slot expired", status=status.HTTP_400_BAD_REQUEST)
        elif result == -2:
            return Response("order already exists", status=status.HTTP_400_BAD_REQUEST)

        order_id = result

        return Response({
            "ok": True,
            "data": order_id
        }, status=status.HTTP_200_OK)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except AddOn.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except FoodItem.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except MealSet.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def rate_order(request):
    try:
        rating = int(request.POST.get("rating", ""))
        order_id = int(request.POST.get("order_id", ""))
        order = Order.objects.get(id=order_id)

        if order.status != OrderStatusChoices.COMPLETED:
            return Response("only completed orders can be rated", status=status.HTTP_400_BAD_REQUEST)

        order.rating = int(rating)
        order.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def cancel_order(request):
    try:
        order_id = int(request.POST.get("order_id", ""))
        order = Order.objects.get(id=order_id)

        dt_now = datetime.now()
        if dt_now.day == order.delivery_date or dt_now.hour >= 22:
            return Response("cannot cancel now", status=status.HTTP_400_BAD_REQUEST)

        order.status = OrderStatusChoices.CANCELLED
        order.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def get_order(request):
    try:
        order_id = int(request.POST.get("order_id", ""))
        order = Order.objects.get(id=order_id)
        order_data = order.in_dict()
        return Response({
            "ok": True,
            "data": order_data
        }, status=status.HTTP_200_OK)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def list_orders(request):
    try:
        customer = request.user.customer
        orders_of_customer = Order.objects.filter(customer=customer)
        response_orders = []
        for order in orders_of_customer:
            response_orders.append(order.in_dict())
        return Response({
            "ok": True,
            "data": response_orders
        }, status=status.HTTP_200_OK)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def modify_order(request):
    try:
        order_id = int(request.POST.get("order_id", ""))
        order = Order.objects.get(id=order_id)
        if order.status != OrderStatusChoices.BOOKED:
            return Response("order modification time expired", status=status.HTTP_400_BAD_REQUEST)

        _process_order(request, order)

        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def _change_customer_default_address(customer, address_lat, address_lon, full_address, address_landmark):
    customer.lat = address_lat
    customer.lon = address_lon
    customer.full_address = full_address
    customer.address_landmark = address_landmark
    customer.save()


def _process_order(request, order=None):
    food_item_id = int(request.POST.get("food_item_id", ""))
    addons_csv = request.POST.get("addons_csv", "")
    address_lat = request.POST.get("address_lat", "")
    address_lon = request.POST.get("address_lon", "")
    full_address = request.POST.get("full_address", "")
    address_landmark = request.POST.get("address_landmark", "")
    is_default_address = bool(request.POST.get("is_default_address", False))

    if order is not None:
        # existing order
        o = order
        mealset = order.mealset
    else:
        # new order
        mealset_id = int(request.POST.get("mealset_id", ""))
        o = Order()
        mealset = MealSet.objects.get(id=mealset_id)
        customer = request.user.customer
        if Order.objects.filter(customer=customer, status__in=active_order_statuses, mealset=mealset).exists():
            return -2  # order already exists

    dt_now = datetime.now()
    if dt_now.date() >= mealset.delivery_date:
        return -1  # slot expired
    elif dt_now.date() == mealset.delivery_date - timedelta(days=1):
        if dt_now.hour >= ENDTIME_THRESHOLD:
            return -1  # slot expired

    food_item = FoodItem.objects.get(id=food_item_id)
    addons_ids = []
    for addon_id in addons_csv.split(','):
        if addon_id != "":
            addons_ids.append(int(addon_id))
    addons = AddOn.objects.filter(id__in=addons_ids)
    customer = request.user.customer

    o.status = OrderStatusChoices.BOOKED
    o.customer = customer
    o.food_item = food_item
    o.lat = address_lat
    o.lon = address_lon
    o.full_address = full_address
    o.address_landmark = address_landmark
    o.mealset = mealset
    o.save()

    o.addons.set(addons)
    o.amount = o.get_total_amount()
    o.save()

    if is_default_address:
        _change_customer_default_address(customer, address_lat, address_lon, full_address, address_landmark)

    return o.id

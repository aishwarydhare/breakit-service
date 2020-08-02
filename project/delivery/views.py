from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.auth_decorator import authenticate
from delivery.models import DeliveryExecutive
from miscellaneous import route_engine_helper
from miscellaneous.date_time_utils import display_time
from miscellaneous.fcm_service import sendFcmMessage
from miscellaneous.logging_utils import show_error
from orders.choices import OrderStatusChoices
from orders.models import Order, active_order_statuses


@api_view(['POST'])
@authenticate
def list_deliveries(request):
    try:
        delivery_executive = request.user.delivery_executive
        active_orders_for_executive = Order.objects.filter(delivery_executive=delivery_executive,
                                                           status__in=active_order_statuses)
        orders_response = []
        for order in active_orders_for_executive:
            orders_response.append(order.in_dict())
        return Response({
            "ok": True,
            "data": orders_response
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def history_deliveries(request):
    try:
        delivery_executive = request.user.delivery_executive
        orders_for_executive = Order.objects.filter(delivery_executive=delivery_executive)
        orders_response = []
        for order in orders_for_executive:
            orders_response.append(order.in_dict())
        return Response({
            "ok": True,
            "data": orders_response
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def pickup_delivery(request):
    try:
        order_id = request.POST.get("order_id", "")
        delivery_executive = request.user.delivery_executive
        order = Order.objects.get(id=order_id, delivery_executive=delivery_executive)
        order.status = OrderStatusChoices.OUT_FOR_DELIVERY
        order.save()

        order.eta = calculate_eta(delivery_executive.lat, delivery_executive.lon, order.lat, order.lon)
        order.save()

        fcm_token = order.customer.user.fcm_token
        if fcm_token != "":
            sendFcmMessage(
                fcm_token,
                "Your order has been picked up",
                "It should reach you in about " + order.eta,
                {
                    "title": "Your order has been picked up",
                    "message": "It should reach you in about " + order.eta,
                    "order_id": order.id
                }
            )
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def complete_delivery(request):
    try:
        order_id = request.POST.get("order_id", "")
        delivery_executive = request.user.delivery_executive
        order = Order.objects.get(id=order_id, delivery_executive=delivery_executive)
        order.status = OrderStatusChoices.COMPLETED
        order.save()
        delivery_executive.orders_fulfilled = delivery_executive.orders_fulfilled + 1
        delivery_executive.save()

        fcm_token = order.customer.user.fcm_token
        if fcm_token != "":
            sendFcmMessage(
                fcm_token,
                "Order Delivered",
                "We are grateful to serve you, thanks.",
                {
                    "title": "Order Delivered",
                    "message": "We are grateful to serve you, thanks.",
                    "mealset_id": order.id
                }
            )
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def fail_delivery(request):
    try:
        order_id = request.POST.get("order_id", "")
        reason = request.POST.get("reason", "")
        delivery_executive = request.user.delivery_executive
        order = Order.objects.get(id=order_id, delivery_executive=delivery_executive)
        if order.status not in active_order_statuses:
            return Response("only active orders can fail", status=status.HTTP_400_BAD_REQUEST)
        order.status = OrderStatusChoices.FAILED
        order.fail_reason = reason
        order.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def update_location(request):
    lat = request.POST.get("lat", "")
    lon = request.POST.get("lon", "")
    if lat == "" or lon == "":
        return Response("invalid lat lon", status=status.HTTP_400_BAD_REQUEST)

    delivery_executive = request.user.delivery_executive
    delivery_executive.lat = lat
    delivery_executive.lon = lon
    delivery_executive.save()

    active_orders_for_executive = Order.objects.filter(delivery_executive=delivery_executive,
                                                       status__in=active_order_statuses)
    for order in active_orders_for_executive:
        order.eta = calculate_eta(lat, lon, order.lat, order.lon)
        order.save()
    try:
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except DeliveryExecutive.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Order.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def calculate_eta(src_lat, src_lon, dest_lat, dest_lon) -> str:
    try:
        eta_response = route_engine_helper.get_eta(src_lat, src_lon, dest_lat, dest_lon)
        eta_time = display_time(eta_response.duration_val)
        return eta_time
    except:
        return "--"

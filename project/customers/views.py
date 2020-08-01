import json
from json import JSONDecodeError

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.auth_decorator import authenticate
from customers.models import Customer
from miscellaneous.logging_utils import show_error


@api_view(['POST'])
@authenticate
def get_profile(request):
    try:
        customer = request.user.customer
        return Response({
            "ok": True,
            "data": customer.in_dict()
        }, status=status.HTTP_200_OK)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def update_profile(request):
    try:
        preference = request.POST.get("preference", "")
        name = request.POST.get("name", "")
        if name == "":
            return Response("name is required", status=status.HTTP_400_BAD_REQUEST)
        tmp = json.loads(preference)  # check json
        customer = request.user.customer
        customer.preference = preference
        customer.name = name
        customer.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except JSONDecodeError as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Customer.DoesNotExist as e:
        return Response(str(e), status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)

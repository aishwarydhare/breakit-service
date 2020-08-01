from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.auth_decorator import authenticate
from customers.models import Customer
from miscellaneous.common_utils import get_4_digit_random_number, get_random_with_n_digits
from miscellaneous.logging_utils import show_error
from .models import User


@api_view(['POST'])
def request_otp(request):
    try:
        mobile = request.POST.get("mobile")
        if mobile in ("", None):
            return Response({
                "ok": False
            }, status=status.HTTP_400_BAD_REQUEST)
        t = User.objects.filter(mobile=mobile)
        if t.exists():
            user = t[0]
        else:
            user = User()
            user.mobile = mobile
        otp = get_4_digit_random_number()
        print("=================== THE OTP IS ", otp, "===================")
        user.latest_otp = otp
        user.save()
        return Response({
            "ok": True,
        }, status=status.HTTP_200_OK)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
def verify_otp(request):
    try:
        mobile = request.POST.get("mobile", "")
        otp = request.POST.get("otp", "")
        t = User.objects.filter(mobile=mobile)
        if t.exists():
            user = t[0]
        else:
            return Response({
                "ok": False
            }, status=status.HTTP_400_BAD_REQUEST)

        # if user.latest_otp == "" or user.latest_otp != otp:
        #     return Response({
        #         "ok": False
        #     }, status=status.HTTP_400_BAD_REQUEST)

        auth_token = get_random_with_n_digits(12)
        print("=================== THE AUTH TOKEN IS ", auth_token, "===================")
        user.auth_token = auth_token
        user.save()

        if not hasattr(user, "customer"):
            c = Customer()
            c.user = user
            c.save()

        return Response({
            "ok": True,
            "data": {
                "auth_token": user.auth_token
            }
        }, status=status.HTTP_200_OK)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def fcm_update(request):
    try:
        fcm = request.POST.get("fcm")
        user = request.user
        user.fcm_token = fcm
        user.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)


@api_view(['POST'])
@authenticate
def logout(request):
    try:
        user = request.user
        user.fcm_token = ""
        user.save()
        return Response({
            "ok": True
        }, status=status.HTTP_200_OK)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)

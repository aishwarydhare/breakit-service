from datetime import datetime, timedelta

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from authentication.auth_decorator import authenticate
from mealset.models import MealSet
from miscellaneous.logging_utils import show_error


@api_view(['POST'])
@authenticate
def get_mealset(request):
    try:
        dt_now = datetime.now()
        mealset = MealSet.objects.get(delivery_date=dt_now.date() + timedelta(days=1))
        if dt_now.hour > 22:
            return Response({
                "ok": True,
                "data": None
            }, status=status.HTTP_200_OK)
        return Response({
            "ok": True,
            "data": mealset.in_dict()
        }, status=status.HTTP_200_OK)
    except MealSet.DoesNotExist:
        return Response({
            "ok": True,
            "data": None
        }, status=status.HTTP_200_OK)
    except Exception as e:
        show_error(e)
        return Response(str(e), status=status.HTTP_500_INTERNAL_SERVER_ERROR)

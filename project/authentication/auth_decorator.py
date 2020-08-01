from rest_framework import status
from rest_framework.response import Response

from config.settings import APIKEY
from miscellaneous.logging_utils import show_error
from .models import User


def authenticate(view_function):
    def _wrapped(request, *args, **kwargs):
        print(request.headers, request.POST, request.GET)
        try:
            auth_token = request.headers["Auth-Token"]
            apikey = request.headers["Api-Key"]
            if 'auth_token' != "" and apikey != "":
                if apikey == APIKEY:
                    t = User.objects.filter(auth_token=auth_token)
                    if t.exists():
                        user = t[0]
                        setattr(request, "user", user)
                        return view_function(request, *args, **kwargs)

            return Response({
                "ok": False
            }, status=status.HTTP_401_UNAUTHORIZED)
        except Exception as e:
            show_error(e)
            return Response(str(e), status=status.HTTP_400_BAD_REQUEST)

    return _wrapped

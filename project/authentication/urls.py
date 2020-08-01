from django.conf.urls import url

import authentication.views as views

urlpatterns = [
    url(r'^auth/request-otp$', views.request_otp),
    url(r'^auth/verify-otp$', views.verify_otp),
    url(r'^logout$', views.logout),
    url(r'^fcm/update$', views.fcm_update),
]

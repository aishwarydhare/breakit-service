from django.conf.urls import url

import orders.views as views

urlpatterns = [
    url(r'^order/today$', views.todays_order),
    url(r'^order/next$', views.next_booking),
    url(r'^order/place$', views.place_order),
    url(r'^order/rate$', views.rate_order),
    url(r'^order/cancel$', views.cancel_order),
    url(r'^order/get$', views.get_order),
    url(r'^order/history$', views.list_orders),
    url(r'^order/modify', views.modify_order),
]

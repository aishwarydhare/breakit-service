from django.conf.urls import url

import delivery.views as views

urlpatterns = [
    url(r'^delivery/list$', views.list_deliveries),
    url(r'^delivery/history$', views.history_deliveries),
    url(r'^delivery/picked$', views.pickup_delivery),
    url(r'^delivery/complete$', views.complete_delivery),
    url(r'^delivery/fail$', views.fail_delivery),
    url(r'^location/update$', views.update_location),
]

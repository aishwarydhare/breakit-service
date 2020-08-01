from django.conf.urls import url

import customers.views as views

urlpatterns = [
    url(r'^customer/profile/get$', views.get_profile),
    url(r'^customer/profile/update$', views.update_profile),
]

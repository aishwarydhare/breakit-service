from django.conf.urls import url

import mealset.views as views

urlpatterns = [
    url(r'^mealset/get$', views.get_mealset),
]

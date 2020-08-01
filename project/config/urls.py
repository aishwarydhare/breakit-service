"""fxf URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('grappelli/', include('grappelli.urls')),
    path('admin/', admin.site.urls),
    url(r'^api/v1/', include(('authentication.urls', 'authentication'), namespace='authentication')),
    url(r'^api/v1/', include(('customers.urls', 'customers'), namespace='customers')),
    url(r'^api/v1/', include(('delivery.urls', 'delivery'), namespace='delivery')),
    url(r'^api/v1/', include(('orders.urls', 'orders'), namespace='orders')),
    url(r'^api/v1/', include(('mealset.urls', 'mealset'), namespace='mealset')),
]

if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]

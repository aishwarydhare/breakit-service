from django.db import models

from miscellaneous.common_utils import get_distance_between_lat_lon
from utilities.models import TimeStampMixin, AddressMixin

_CITY_THRESHOLD = 50  # km
_LOCALITY_THRESHOLD = 10  # km


class City(TimeStampMixin, AddressMixin):
    name = models.CharField(max_length=50, unique=True, null=False, blank=False)
    active_radius = models.IntegerField(default=_CITY_THRESHOLD, null=False, blank=False)
    is_active = models.BooleanField(default=True)

    class Meta:
        app_label = "operation_manifest"
        db_table = 'city'

    def __str__(self):
        return self.name

    @classmethod
    def get_cities_for_user(cls, lat, lon):
        arr = []
        for city in cls.objects.all():
            if get_distance_between_lat_lon(lat, lon, city.lat, city.lon) <= city.active_radius:
                arr.append(city)
        return arr

    def in_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "lat": self.name,
            "lon": self.name,
        }


class Locality(TimeStampMixin, AddressMixin):
    name = models.CharField(max_length=50, unique=True, null=False, blank=False)
    city = models.ForeignKey('operation_manifest.City', on_delete=models.PROTECT, null=False, blank=False)
    active_radius = models.IntegerField(default=_LOCALITY_THRESHOLD, null=False, blank=False)
    is_active = models.BooleanField(default=True)

    class Meta:
        app_label = "operation_manifest"
        db_table = 'locality'

    def __str__(self):
        return self.name

    @classmethod
    def get_localities_near_user(cls, lat, lon):
        arr = []
        for locality in cls.objects.all():
            if get_distance_between_lat_lon(lat, lon, locality.lat, locality.lon) <= locality.active_radius:
                arr.append(locality)
        return arr

    def in_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "lat": self.lat,
            "lon": self.lon,
        }


class FoodSpeciality(TimeStampMixin):
    type = models.CharField(max_length=20, null=False, blank=False)
    icon = models.CharField(max_length=250, null=False, blank=False)

    class Meta:
        app_label = "operation_manifest"
        db_table = 'food_speciality'

    def __str__(self):
        return self.type

    def in_dict(self):
        return {
            "id": self.id,
            "type": self.type,
            "icon": self.icon,
        }

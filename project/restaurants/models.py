import json
from json import JSONDecodeError

from django.core.exceptions import ValidationError
from django.db import models

from utilities.models import TimeStampMixin, AddressMixin


class Restaurant(TimeStampMixin, AddressMixin):
    user = models.OneToOneField('authentication.User', on_delete=models.PROTECT, null=False, blank=False)
    name = models.CharField(max_length=100, null=False, blank=False)
    rating = models.IntegerField(default=-1, null=False, blank=False)
    orders_fulfilled = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        app_label = "restaurants"
        db_table = 'restaurants'

    def update_rating(self, received_rating):
        # todo
        new_rating = received_rating
        self.rating = new_rating
        self.save()

    def __str__(self):
        return str(self.id) + ' ' + self.name

    def in_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "rating": self.rating,
            "orders_fulfilled": self.orders_fulfilled
        }


class AddOn(TimeStampMixin):
    restaurant = models.ForeignKey('restaurants.Restaurant', on_delete=models.PROTECT, null=False, blank=False)
    name = models.CharField(max_length=100, null=False, blank=False)
    description = models.CharField(max_length=100, null=False, blank=False)
    amount = models.IntegerField(null=False, blank=False)

    class Meta:
        app_label = "restaurants"
        db_table = 'addons'

    def __str__(self):
        return str(self.id) + ' ' + self.restaurant.name + '-' + self.name

    def in_dict(self):
        return {
            "id": self.id,
            "restaurant": self.restaurant.in_dict(),
            "name": self.name,
            "description": self.description,
            "amount": self.amount,
        }


class FoodItem(TimeStampMixin):
    restaurant = models.ForeignKey('restaurants.Restaurant', on_delete=models.PROTECT, null=False, blank=False)
    name = models.CharField(max_length=100, null=False, blank=False)
    description = models.CharField(max_length=100, null=False, blank=False)
    speciality = models.ForeignKey('operation_manifest.FoodSpeciality', on_delete=models.PROTECT, null=False,
                                   blank=False)
    nutrition = models.CharField(max_length=250, null=False, blank=False, help_text="enter in JSON")
    image = models.CharField(max_length=250, null=False, blank=False, help_text="image url from internet")
    amount = models.IntegerField(null=False, blank=False)
    recommended_addons = models.ManyToManyField('restaurants.AddOn')

    class Meta:
        app_label = "restaurants"
        db_table = 'food_items'

    def __str__(self):
        return str(self.id) + ' ' + self.restaurant.name + '-' + self.name

    def in_dict(self):
        recommended_addons = []
        for addon in self.recommended_addons.all():
            recommended_addons.append(addon.in_dict())
        return {
            "id": self.id,
            "restaurant": self.restaurant.in_dict(),
            "name": self.name,
            "description": self.description,
            "speciality": self.speciality.in_dict(),
            "nutrition": self.nutrition,
            "amount": self.amount,
            "recommended_addons": recommended_addons,
            "image": self.image,
        }

    def clean(self):
        try:
            tmp = json.loads(self.nutrition)
            super().clean()
        except JSONDecodeError:
            raise ValidationError("nutrition fields needs to be a valid json")

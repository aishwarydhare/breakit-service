from django.db import models

from utilities.models import TimeStampMixin, AddressMixin
from .choices import OrderStatusChoices

active_order_statuses = [
    OrderStatusChoices.BOOKED,
    OrderStatusChoices.OUT_FOR_DELIVERY,
]

inactive_order_statuses = [
    OrderStatusChoices.COMPLETED,
    OrderStatusChoices.CANCELLED,
    OrderStatusChoices.FAILED,
]

ENDTIME_THRESHOLD = 22  # 10 PM


class Order(TimeStampMixin, AddressMixin):
    amount = models.IntegerField(default=0)
    CHOICES = [
        (OrderStatusChoices.BOOKED, 'Booked'),
        (OrderStatusChoices.OUT_FOR_DELIVERY, 'Out for delivery'),
        (OrderStatusChoices.COMPLETED, 'Completed'),
        (OrderStatusChoices.CANCELLED, 'Cancelled'),
        (OrderStatusChoices.FAILED, 'Failed'),
    ]
    status = models.IntegerField(choices=CHOICES, null=False, blank=False)
    customer = models.ForeignKey('customers.Customer', on_delete=models.PROTECT, null=True, blank=True)
    delivery_executive = models.ForeignKey('delivery.DeliveryExecutive', on_delete=models.PROTECT, null=True,
                                           blank=True)
    food_item = models.ForeignKey('restaurants.FoodItem', on_delete=models.PROTECT, null=True, blank=True)
    addons = models.ManyToManyField('restaurants.AddOn', blank=True)
    fail_reason = models.TextField(default="", blank=True)
    rating = models.IntegerField(default=-1, null=False, blank=False)
    full_address = models.TextField(null=False, blank=False)
    address_landmark = models.TextField(null=False, blank=False)
    mealset = models.ForeignKey('mealset.MealSet', on_delete=models.PROTECT, null=False, blank=False)

    @property
    def delivery_date(self):
        return self.mealset.delivery_date

    @property
    def locality(self):
        return self.mealset.locality

    @property
    def restaurant(self):
        return self.food_item.restaurant

    class Meta:
        app_label = "orders"
        db_table = 'orders'

    def get_total_amount(self):
        amount = 0
        for addon in self.addons.all():
            amount += addon.amount
        amount += self.food_item.amount
        return amount

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        super().save(force_insert, force_update, using, update_fields)
        if self.rating != -1:
            self.restaurant.update_rating(self.rating)

    def in_dict(self):
        addons = []
        for addon in self.addons.all():
            addons.append(addon.in_dict())
        return {
            "id": self.id,
            "amount": self.amount,
            "delivery_date": self.delivery_date,
            "status": self.status,
            "customer": self.customer.in_dict(),
            "delivery_executive": self.delivery_executive.in_dict() if self.delivery_executive is not None else None,
            "locality": self.locality.in_dict(),
            "restaurant": self.restaurant.in_dict(),
            "food_item": self.food_item.in_dict(),
            "addons": addons,
            "fail_reason": self.fail_reason,
            "full_address": self.full_address,
            "address_landmark": self.address_landmark,
            "address_lat": self.lat,
            "address_lon": self.lon,
            "customer_mobile": self.customer.user.mobile,
            "mealset": self.mealset.in_dict()
        }

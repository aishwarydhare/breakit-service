from django.db import models

from utilities.models import TimeStampMixin, AddressMixin


class DeliveryExecutive(AddressMixin, TimeStampMixin):
    name = models.CharField(max_length=100, null=False, blank=False)
    user = models.OneToOneField('authentication.User', on_delete=models.PROTECT, related_name="delivery_executive",
                                null=False, blank=False)
    rating = models.IntegerField(default=-1, null=False, blank=False)
    orders_fulfilled = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        app_label = "delivery"
        db_table = 'delivery_executives'

    def update_rating(self, received_rating):
        # todo
        new_rating = received_rating
        self.rating = new_rating
        self.save()

    def in_dict(self):
        return {
            "id": self.id,
            "user_id": self.user.id,
            "mobile": self.user.mobile,
            "name": self.name,
            "rating": self.rating,
            "orders_fulfilled": self.orders_fulfilled,
            "lat": self.lat,
            "lon": self.lon,
        }

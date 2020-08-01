from django.db import models

from utilities.models import TimeStampMixin, AddressMixin


class Customer(TimeStampMixin, AddressMixin):
    name = models.CharField(max_length=100, null=False, blank=False)
    user = models.OneToOneField('authentication.User', on_delete=models.PROTECT, related_name="customer", null=False, blank=False)
    preference = models.TextField(default="")
    full_address = models.TextField(null=False, blank=False)
    address_landmark = models.TextField(null=False, blank=False)

    class Meta:
        app_label = "customers"
        db_table = "customers"

    def in_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "user_id": self.user.id,
            "mobile": self.user.mobile,
            "preference": self.preference,
            "full_address": self.full_address,
            "address_landmark": self.address_landmark,
            "lat": self.lat,
            "lon": self.lon,
        }

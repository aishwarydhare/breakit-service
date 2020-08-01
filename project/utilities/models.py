from django.db import models


class TimeStampMixin(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class AddressMixin(models.Model):
    lat = models.TextField(blank=True, null=True)
    lon = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True

from django.db import models

from utilities.models import TimeStampMixin


class MealSet(TimeStampMixin):
    locality = models.ForeignKey('operation_manifest.Locality', on_delete=models.PROTECT, null=False, blank=False)
    delivery_date = models.DateField(unique=True)
    food_item_one = models.ForeignKey('restaurants.FoodItem', related_name="mealset_food_item_one",
                                      on_delete=models.PROTECT, null=False, blank=False)
    food_item_two = models.ForeignKey('restaurants.FoodItem', related_name="mealset_food_item_two",
                                      on_delete=models.PROTECT, null=False, blank=False)
    food_item_three = models.ForeignKey('restaurants.FoodItem', related_name="mealset_food_item_three",
                                        on_delete=models.PROTECT, null=False, blank=False)
    food_item_four = models.ForeignKey('restaurants.FoodItem', related_name="mealset_food_item_four",
                                       on_delete=models.PROTECT, null=False, blank=False)
    food_item_five = models.ForeignKey('restaurants.FoodItem', related_name="mealset_food_item_five",
                                       on_delete=models.PROTECT, null=False, blank=False)

    class Meta:
        app_label = "mealset"
        db_table = 'mealsets'
        unique_together = ('locality', 'delivery_date',)

    def in_dict(self):
        food_items = []
        for item in [self.food_item_one, self.food_item_two, self.food_item_three, self.food_item_four,
                     self.food_item_five]:
            food_items.append(item.in_dict())
        return {
            "id": self.id,
            "locality": self.locality.in_dict(),
            "delivery_date": self.delivery_date,
            "food_items": food_items,
        }

    def __str__(self):
        return str(self.id) + " " + str(self.delivery_date) + " " + str(self.locality)

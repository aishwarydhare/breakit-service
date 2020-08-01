from datetime import datetime, timedelta

from customers.models import Customer
from mealset.models import MealSet
from miscellaneous.fcm_service import sendFcmMessage
from orders.models import Order, active_order_statuses

dt_now = datetime.now()
m = MealSet.objects.filter(delivery_date=dt_now.date() + timedelta(days=2))
if m.exists():
    mealset_today = m[0]
    customers_with_order_already_placed = Order.objects.filter(mealset=mealset_today, status__in=active_order_statuses)
    customers_to_notify = Customer.objects.all().exclude(id__in=customers_with_order_already_placed)
    for customer in customers_to_notify:
        fcm_token = customer.user.fcm_token
        sendFcmMessage(
            fcm_token,
            "Book your meal now",
            "White sauce pasta, Macroni, Poha or Biryani. Place order before 10 PM.",
            {
                "title": "Book your meal now",
                "message": "White sauce pasta, Macroni, Poha or Biryani. Place order before 10 PM.",
                "mealset_id": mealset_today.id
            }
        )

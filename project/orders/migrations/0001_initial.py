# Generated by Django 2.2.1 on 2020-07-29 04:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('delivery', '0001_initial'),
        ('restaurants', '0001_initial'),
        ('mealset', '0001_initial'),
        ('customers', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('lat', models.TextField(blank=True, null=True)),
                ('lon', models.TextField(blank=True, null=True)),
                ('amount', models.IntegerField(default=0)),
                ('status', models.IntegerField(choices=[(1, 'Booked'), (2, 'Out for delivery'), (3, 'Completed'), (4, 'Cancelled'), (5, 'Failed')])),
                ('fail_reason', models.TextField(blank=True, default='')),
                ('rating', models.IntegerField(default=-1)),
                ('full_address', models.TextField()),
                ('address_landmark', models.TextField()),
                ('addons', models.ManyToManyField(blank=True, null=True, to='restaurants.AddOn')),
                ('customer', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='customers.Customer')),
                ('delivery_executive', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='delivery.DeliveryExecutive')),
                ('food_item', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, to='restaurants.FoodItem')),
                ('mealset', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='mealset.MealSet')),
            ],
            options={
                'db_table': 'orders',
            },
        ),
    ]

# Generated by Django 2.2.1 on 2020-08-02 00:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0003_fooditem_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='fooditem',
            name='is_veg',
            field=models.BooleanField(default=True),
            preserve_default=False,
        ),
    ]
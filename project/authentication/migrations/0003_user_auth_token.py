# Generated by Django 2.2.1 on 2020-07-29 04:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0002_user_is_staff'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='auth_token',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
    ]

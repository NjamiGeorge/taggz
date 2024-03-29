# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-07-11 03:31
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0003_useraddress'),
    ]

    operations = [
        migrations.AddField(
            model_name='useraddress',
            name='shipping_address',
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='useraddress',
            name='type',
            field=models.CharField(choices=[('billing', 'Billing'), ('shipping', 'Shipping')], default=1, max_length=20),
            preserve_default=False,
        ),
    ]

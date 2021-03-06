# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-08-24 05:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0009_auto_20170723_0100'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='order_total',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
        migrations.AlterField(
            model_name='order',
            name='shipping_total_price',
            field=models.DecimalField(decimal_places=2, default=10.99, max_digits=10),
        ),
    ]

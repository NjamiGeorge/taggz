# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-07-05 08:06
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0062_product_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='checkout',
            name='checkouitem',
        ),
        migrations.DeleteModel(
            name='CheckOut',
        ),
    ]
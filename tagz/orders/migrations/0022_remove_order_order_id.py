# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-10-06 20:03
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0021_auto_20171006_1946'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='order_id',
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-08-21 08:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0069_remove_customer_product'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customer',
            old_name='created',
            new_name='created_at',
        ),
    ]

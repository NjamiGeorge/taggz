# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-09-24 08:40
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0080_auto_20170922_1844'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='entry_date',
            field=models.DateField(default=datetime.date(2017, 9, 24)),
        ),
    ]

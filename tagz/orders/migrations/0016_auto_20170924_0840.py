# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-09-24 08:40
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0015_auto_20170922_1844'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2017, 9, 24, 8, 40, 4, 834830, tzinfo=utc)),
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-02-11 11:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0019_auto_20170211_1113'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='name',
            field=models.CharField(default=1, max_length=100),
        ),
    ]

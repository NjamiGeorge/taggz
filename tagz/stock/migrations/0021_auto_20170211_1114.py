# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-02-11 11:14
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0020_auto_20170211_1113'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='stock.Product'),
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-06-19 06:08
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0057_auto_20170619_0601'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='size',
            field=models.CharField(choices=[('extra small', 'extra small'), ('small', 'small'), ('medium', 'medium'), ('large', 'large'), ('extra large', 'extra large'), ('doubel xl', 'extra x large'), ('elastic', 'elastic'), ('size 30', 'size 30'), ('size 32', 'size 32'), ('size 34', 'size 34'), ('size 36', 'size 36'), ('size 38', 'size 38'), ('size 40', 'size 40'), ('size 42', 'size 42')], default='elastic', max_length=20),
        ),
    ]
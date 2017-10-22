# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-06-19 05:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0055_auto_20170619_0541'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='size',
            field=models.CharField(choices=[('xs', 'extra small'), ('s', 'small'), ('m', 'medium'), ('l', 'large'), ('xl', 'extra large'), ('xxl', 'extra x large'), ('elastic', 'elastic'), ('30', '30'), ('32', '32'), (34, '34'), (36, '36'), (38, '38'), (40, '40'), (42, '42')], default='elastic', max_length=20),
        ),
    ]

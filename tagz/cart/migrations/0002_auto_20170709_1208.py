# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-07-09 12:08
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='cart',
            old_name='items',
            new_name='item',
        ),
    ]

# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-05-30 05:36
from __future__ import unicode_literals

from django.db import migrations
import django.db.models.manager


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0046_auto_20170526_1439'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='category',
            managers=[
                ('variations', django.db.models.manager.Manager()),
            ],
        ),
    ]

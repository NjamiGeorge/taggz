# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-04-22 10:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0034_auto_20170311_0646'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orders',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('item', models.CharField(max_length=50)),
                ('quantity', models.PositiveIntegerField()),
                ('contact', models.IntegerField()),
            ],
        ),
    ]

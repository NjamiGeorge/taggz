# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-02-14 08:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stock', '0026_auto_20170214_0819'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shoe',
            name='size',
            field=models.CharField(choices=[('five', '5'), ('six', '6'), ('seven', '7'), ('seven half', '7.5'), ('eight half', '8.5'), ('nine', '9'), ('nine half', '9.5'), ('ten', '10'), ('ten half', '10.5'), ('eleven', '11'), ('twelve', '12')], max_length=50),
        ),
    ]
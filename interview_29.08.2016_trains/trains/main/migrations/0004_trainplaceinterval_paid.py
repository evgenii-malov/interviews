# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-28 12:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_auto_20160828_1151'),
    ]

    operations = [
        migrations.AddField(
            model_name='trainplaceinterval',
            name='paid',
            field=models.BigIntegerField(default=False),
        ),
    ]

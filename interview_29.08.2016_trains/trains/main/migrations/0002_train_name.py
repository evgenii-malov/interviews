# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-28 11:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='train',
            name='name',
            field=models.CharField(max_length=30, null=True),
        ),
    ]

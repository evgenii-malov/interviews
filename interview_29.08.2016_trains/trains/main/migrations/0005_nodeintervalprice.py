# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-28 12:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_trainplaceinterval_paid'),
    ]

    operations = [
        migrations.CreateModel(
            name='NodeInterValPrice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.PositiveIntegerField(verbose_name='\u0446\u0435\u043d\u0430 \u043f\u0440\u043e\u043c\u0435\u0436\u0443\u0442\u043a\u0430')),
                ('node1', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='city1', to='main.City')),
                ('node2', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='city2', to='main.City')),
            ],
        ),
    ]
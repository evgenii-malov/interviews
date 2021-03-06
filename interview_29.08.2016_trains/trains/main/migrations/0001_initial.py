# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-28 11:03
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('city', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='DateTrain',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Passenger',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fio', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='PathNode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time_delta', models.PositiveIntegerField()),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.City')),
            ],
        ),
        migrations.CreateModel(
            name='Place',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.PositiveSmallIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Train',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.PositiveIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='TrainPlaceInterval',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
                ('datetrain', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.DateTrain')),
                ('end', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.PathNode')),
                ('passenger', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Passenger')),
                ('place', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Place')),
                ('start', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pn_start', to='main.PathNode')),
            ],
        ),
        migrations.CreateModel(
            name='Vagon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.PositiveSmallIntegerField()),
                ('datetrain', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.DateTrain')),
            ],
        ),
        migrations.AddField(
            model_name='place',
            name='vagon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Vagon'),
        ),
        migrations.AddField(
            model_name='pathnode',
            name='train',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Train'),
        ),
        migrations.AddField(
            model_name='datetrain',
            name='train',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Train'),
        ),
    ]

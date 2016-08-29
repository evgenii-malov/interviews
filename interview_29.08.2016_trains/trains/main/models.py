# coding: utf8
from __future__ import unicode_literals

from django.db import models


class City(models.Model):
    city = models.CharField(max_length=30)

    def __unicode__(self):
        return self.city


class Train(models.Model):
    number = models.PositiveIntegerField()
    name = models.CharField(null=True, max_length=30)

    def __unicode__(self):
        return "поезд {} ({})".format(self.number, self.name)


class DateTrain(models.Model):
    train = models.ForeignKey(Train)
    start = models.DateTimeField()

    def __unicode__(self):
        return "{}:{}".format(self.train, self.start)


class Passenger(models.Model):
    fio = models.CharField(max_length=255)

    def __unicode__(self):
        return self.fio


class Vagon(models.Model):
    datetrain = models.ForeignKey(DateTrain)
    number = models.PositiveSmallIntegerField()

    def __unicode__(self):
        return "{}:{}".format(self.datetrain, self.number)


class Place(models.Model):
    vagon = models.ForeignKey(Vagon)
    number = models.PositiveSmallIntegerField()

    def __unicode__(self):
        return "вагон: {}, место:{}".format(self.vagon, self.number)


class PathNode(models.Model):
    train = models.ForeignKey(Train)
    city = models.ForeignKey(City)
    time_delta_minutes = models.PositiveIntegerField()

    def __unicode__(self):
        return "{}. узел: {} время: {} минут".format(
            self.train, self.city, self.time_delta_minutes)


class NodeIntervalPrice(models.Model):
    node1 = models.ForeignKey(City, related_name="city1")
    node2 = models.ForeignKey(City, related_name="city2")
    price = models.PositiveIntegerField(verbose_name="цена промежутка")

    def __unicode__(self):
        return "от {} до {} цена {}".format(self.node1, self.node2, self.price)


class TrainPlaceInterval(models.Model):
    datetrain = models.ForeignKey(DateTrain)
    place = models.ForeignKey(Place)
    passenger = models.ForeignKey(Passenger)
    start = models.ForeignKey(PathNode, related_name="pn_start")
    end = models.ForeignKey(PathNode)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    # timeout after 5 min false not payed
    paid = models.BooleanField(default=False)

    def __unicode__(self):
        return "{} место: {} время от {} до {}".format(
            self.passenger, self.place, self.start, self.end)

    # def save(self):
    #     время от начала маршрута
    #     self.datetrain.start_time = self.datetrain.start + self.start.time_delta_minutes
    #     self.datetrain.end_time = self.datetrain.start + self.end.time_delta_minutes

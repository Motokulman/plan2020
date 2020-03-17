from django.db import models

from django.urls import reverse
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import User
from django.contrib.auth.models import Permission, Group
from django.contrib.postgres.fields import JSONField

class PileGrillageFoundationWorkPrices(models.Model):
    """Модель, представляющая стоимость фундамента с ценой. Одному поставщику принадлежит только одна такая запись"""
    const_expenditure = models.FloatField(
        verbose_name='Постоянные трудозатраты, чел.час')
    transportation_procurement_cost = models.FloatField(
        verbose_name='Транспортно-заготовительные расходы, рублей')
    reinforcement_binding = models.FloatField(
        verbose_name='Вязка 1м арматуры ростверка, чел.час')
    clamp = models.FloatField(verbose_name='Изготовление 1 хомута, чел.час')
    pile_frame = models.FloatField(
        verbose_name='Изготовление свайного каркаса, чел.час')
    formwork = models.FloatField(
        verbose_name='Установка 1кв.м. опалубки (ламфанера), чел.час')
    #ground_leveling = models.FloatField(verbose_name='Выравнивание 1кв.м. грунта, чел.час')
    #ruberoid_lining = models.FloatField(verbose_name='Гидроизоляция рубероидом 1пог.м. опалубки, чел.час')
    #grillage_pour = models.FloatField(verbose_name='Заливка 1куб.м. бетона, чел.час')
    length_costs = models.FloatField(
        verbose_name='Затраты, зависящие от длины ростверка, за 1 пог.м., чел.час')
    square_costs = models.FloatField(
        verbose_name='Затраты, зависящие от площали ростверка, за 1 кв.м., чел.час')
    volume_costs = models.FloatField(
        verbose_name='Затраты, зависящие от объема бетона ростверка, за 1 куб.м., чел.час')
    pile_pour = models.FloatField(verbose_name='Заливка 1 сваи, чел.час')
    man_hours_cost = models.IntegerField(
        verbose_name='Оплата рабочим за 1 чел.час')
    man_hours_profit = models.IntegerField(verbose_name='Прибыль с 1 чел.часа')

    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        verbose_name = 'Стоимость свайно-ростверкового фундамента'
        verbose_name_plural = 'Стоимость свайно-ростверковых фундаментов'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.owner}'

    def get_absolute_url(self):
        """Returns the url to access a detail record for this position."""
        return reverse('my-pile-grillage-foundation-prices', args=[str(self.id)])
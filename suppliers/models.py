from django.db import models
from geography.models import *
from brands.models import *

class Manufacturer(models.Model):
    """Модель, представляющая непосредственного производителя материала. Например, Кощаковский завод, Чайковский и т.д. Какой-нибудь местный завод может производить под маркой Wienerberger например"""
    # применяется для быстрой идентификации производителя товара в юзеринтерфейсе, не более того
    alias = models.CharField(max_length=200,
                            help_text='Простонародное название производителя материала. Например, Кощаковский, Чайковский и т.д.') # точное наименование есть смысл хранить в юрлицах
    name = models.CharField(unique=True, max_length=200,
                            help_text='Полное название производителя материала. Например, Кощаковский, Чайковский и т.д.') # точное наименование есть смысл хранить в юрлицах
    city = models.ForeignKey(
        City, help_text='Выберите город', on_delete=models.SET_NULL, null=True, blank=True)
    brand = models.ForeignKey(
        Brand, help_text='Выберите бренд (например, Wienerberger), если есть', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Производитель материала'
        verbose_name_plural = 'Производители материалов'

    def __str__(self):
        """String for representing the Model object."""
        return self.name



class Activity(models.Model):
    """Модель, представляющая доступные наименования видов деятельности: проектирование, строительный подряд, поставка/продажа материалов, юридические услуги"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=200, help_text='Введите наименование вида деятельности')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Вид деятельности'
        verbose_name_plural = 'Виды деятельности'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class Provider(models.Model):
    """Модель, представляющая бренд, название поставщика: подрядчика, архитектора, продавца. У каждого бренда м.б. магазин, причем как один магазинчик, так и сеть по всей РФ и миру"""
    # каждый поставщик может иметь разные юрлица
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите название постащика, м.б. зарегистрированное или нет')
    # primary_activity = models.ForeignKey('Activity', on_delete=models.SET_NULL, help_text='Выберите основной вид деятельности', related_name='primary_activity', null=True, blank=True)
    # secondary_activity = models.ManyToManyField(
    #     Activity, help_text='Выберите дополнительные виды деятельности', related_name='secondary_activity', null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Поставщик услуг/материалов'
        verbose_name_plural = 'Поставщики услуг/материалов'

    def __str__(self):
        """String for representing the Model object."""
        return self.name
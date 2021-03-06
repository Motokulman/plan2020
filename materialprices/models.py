from django.db import models
from django.conf import settings
from materials.models import *
from django.contrib.auth.models import User

class RockWallMaterialPrice(models.Model):
    """Модель, представляющая запись с ценой. Содержит единицу общепринятого товара, но принадлежащую какому-то продавцу"""
    price = models.FloatField()
    name = models.ForeignKey(RockWallMaterialUnit, on_delete=models.CASCADE)
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Цены каменные стеновые материалы'
        verbose_name_plural = 'Цены каменные стеновые материалы'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.price}, {self.owner}'

class InsulationPrice(models.Model):
    """Модель, представляющая запись с ценой. Содержит единицу общепринятого товара, но принадлежащую какому-то продавцу"""
    price = models.FloatField()
    name = models.ForeignKey(Insulation, on_delete=models.CASCADE)
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Цены утеплители'
        verbose_name_plural = 'Цены утеплители'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.price}, {self.owner}'

# class MaterialPrice(models.Model):
#     """Модель, представляющая запись с ценой. Содержит единицу общепринятого товара, но принадлежащую какому-то продавцу"""

#     MATERIAL = (
#         ('rock_wall', 'Каменный стеновой материал'),
#         # ('wood', 'Дерево'),
#         # ('vinyl', 'Винил'),
#     )
#     material = models.CharField(
#         max_length=9,
#         choices=MATERIAL,
#         default='rock_wall',
#         help_text='Тип материала',
#     )

#     price = models.FloatField()
#     name = models.IntegerField()
#     owner = models.ForeignKey(
#         User, on_delete=models.SET_NULL, null=True, blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Цена материала'
#         verbose_name_plural = 'Цены на материалы'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name}, {self.price}, {self.owner}'
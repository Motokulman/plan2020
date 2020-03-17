from django.db import models
from brands.models import *

class DecorativeBrickFace(models.Model):
    """Модель, представляющая названия декоративных граней рядовых кирпичей """
    name = models.CharField(max_length=200,
                            help_text='Название рисунка') 
    brand = models.ManyToManyField(Brand,
                             help_text='Бренд,который делает такой рисунок на своих кирпичах. М.б.несколько', blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Названея декоративной грани рядового кирпича'
        verbose_name_plural = 'Названия декоративных граней рядовых кирпичей'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.brand}'

from django.db import models
from django.contrib.auth.models import User

class LegalEntity(models.Model):
    """Модель юридических лиц - ООО, ИП АО и т.д."""
    name = models.CharField(max_length=200, verbose_name='Название')
    INN = models.IntegerField(unique=True, verbose_name='ИНН')
    administrator = models.ManyToManyField(User, verbose_name='Пользователь, администрирующий данное юрлицо в системе')

    FORM = (
        ('e', 'ИП'),
        ('l', 'ООО'),
        ('c', 'АО'),
    )

    form = models.CharField(
        max_length=1,
        choices=FORM,
        blank=True,
        default='l',
        verbose_name='Организационно-правовая форма',
    )

    def __str__(self):
        """String for representing the Model object."""
        return self.name
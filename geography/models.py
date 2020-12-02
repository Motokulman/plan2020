from django.db import models


class City(models.Model):
    """Модель, представляющая список городов"""
    name = models.CharField(max_length=200,
                            help_text='Введите город')
    region = models.ForeignKey('Region', on_delete=models.CASCADE,
                            help_text='Регион', null=True, blank=True)
    heating_period_duration = models.IntegerField(help_text='Продолжительность отопительного периода, сут. СП 131.13330.2018 "СНиП 23-01-99* Строительная климатология". См. Таблица 1, столбец 11', null=True, blank=True)  # СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 11, https://www.teplo-info.com/snip/otopitelniy_period
    heating_period_temperature = models.FloatField(help_text='РАЗДЕЛИТЕЛЬ - ТОЧКА. Средняя температура отопительного периода, град. C. столбец 12', null=True, blank=True)  # СП 131.13330.2018 "СНиП 23-01-99* Строительная климатология". См. Таблица 1, столбец 12, https://www.teplo-info.com/snip/otopitelniy_period
 # https://webdevblog.ru/logirovanie-izmeneniya-dannyh-v-modelyah-django/ - отследивание изменения БД, например, поменяли исходный показатель, пересчитаем расчетный
    class Meta:
        ordering = ('name',)
        verbose_name = 'Город'
        verbose_name_plural = 'Города'

    def __str__(self):
        """String for representing the Model object."""
        return self.name

class Country(models.Model):
    """Модель, представляющая список стран"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите страну', null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Страна'
        verbose_name_plural = 'Страны'

    def __str__(self):
        """String for representing the Model object."""
        return self.name

class Region(models.Model):
    """Модель, представляющая список регионов стран"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите регион')    
    code = models.IntegerField(unique=True,
                            help_text='Цифровой код региона', null=True, blank=True)
    country = models.ForeignKey('Country', on_delete=models.CASCADE,
                            help_text='Страна', null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Регион'
        verbose_name_plural = 'Регионы'

    def __str__(self):
        """String for representing the Model object."""
        return self.name

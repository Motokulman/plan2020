from django.db import models


class Brand(models.Model):
    """Модель, представляющая бренд товара, материала, например, Wienerberger. То есть, если Porotherm 44 - это trademark самого материала, то Wienerberger - это бренд завода"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите основной бренд, например, Wienerberger')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Основной бренд'
        verbose_name_plural = 'Основные бренды'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class SubBrand_1(models.Model):
    """Модель, представляющая торговую марку, например, Porotherm,  и т.д."""
    brand = models.ForeignKey(
        'Brand', on_delete=models.CASCADE, null=True)
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите торговую марку внутри бренда, например, Porotherm и т.д.')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Подбренд 1)'
        verbose_name_plural = 'Подбренды 1)'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class SubBrand_2(models.Model):
    """Модель, представляющая индекс серии товаров внутри торговой марки что внутри бренда"""
    sub_brand_1 = models.ForeignKey('SubBrand_1', on_delete=models.CASCADE)
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите индекс серии товаров внутри торговой марки что внутри бренда, если она есть')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Подбренд 2)'
        verbose_name_plural = 'Подбренды 2)'

    def __str__(self):
        """String for representing the Model object."""
        return self.name

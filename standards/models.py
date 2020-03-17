from django.db import models

class MarkM(models.Model):
    """Модель описывает марки материалов с индексом М. Например, марка М300 или М125"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(max_length=5, help_text='Введите марку М')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Марка М'
        verbose_name_plural = 'Марки М'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'


class MarkD(models.Model):
    """Модель описывает марки материалов с индексом D. Обычно это марка газобетона по средней плотности. Например, D1000"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(max_length=5, help_text='Введите марку D')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Марка D'
        verbose_name_plural = 'Марки D'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'


class MarkF(models.Model):
    """Модель описывает марки материалов морозостойкости F. Обычно это марка газобетона по средней плотности. Например, F50"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=5, help_text='Введите марку морозостойкости F')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Марка морозостойкости F'
        verbose_name_plural = 'Марки морозостойкости F'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'


class ClassB(models.Model):
    """Модель описывает классы материалов с индексом В. Обычно это марка бетона, газобетона. Например, В3,5 или В20"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(max_length=5, help_text='Введите класс В')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Класс В бетона'
        verbose_name_plural = 'Классы В бетонов'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'


class ClassАverageDensity(models.Model):
    """Модель описывает классы материалов по средней плотности"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=5, help_text='Введите класс средней плотности')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Класс средней плотности'
        verbose_name_plural = 'Классы средней плотности'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'

class NFSize(models.Model):
    """Модель описывает стандартные размеры НФ"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=200, help_text='Введите название размера')
    greater_bed_size = models.IntegerField(
        blank=True, null=True, help_text='Больший размер постели (длина), мм')
    minor_bed_size = models.IntegerField(
        blank=True, null=True, help_text='Меньший размер постели (ширина), мм')
    height = models.IntegerField(
        blank=True, null=True, help_text='Высота (толщина), мм')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Размер НФ'
        verbose_name_plural = 'Размеры НФ'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.greater_bed_size}, {self.minor_bed_size}, {self.height})'

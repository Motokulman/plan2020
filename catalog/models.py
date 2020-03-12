from django.db import models
from django.conf import settings
# Used to generate URLs by reversing the URL patterns
from django.urls import reverse
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import User
from django.contrib.auth.models import Permission, Group
from django.contrib.postgres.fields import JSONField


# Добавим классу пользователя новые поля, в которых будем хранить настройки


# class Application(models.Model):
#     """Модель, представляющая область применения материала, например, стеновой, облицовочный, цоколь"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите применение материала, например, стеновой, облицовочный, цоколь')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Область применения материала'
#         verbose_name_plural = 'Области применения материалов'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name

# class RockWallMaterial(models.Model):
#     """Модель, представляющая тип материала, например, краснвй кирпич любой, Поротерм 44 и т.д."""
#     var_name = models.CharField(unique = True, default = 'default_identifier', max_length=200, help_text='Имя переменной для использования в коде')
#     name = models.CharField(max_length=200, help_text='Название')

#     work_size = models.IntegerField(
#         blank=True, null=True, help_text='Рабочий (формирующий толщину стены) размер, мм')
#     minor_bed_size = models.IntegerField(
#         blank=True, null=True, help_text='Меньший размер постели (ширина), мм')
#     height = models.IntegerField(
#         blank=True, null=True, help_text='Высота (толщина), мм')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Стеновые материалы для использования в расчетах'
#         verbose_name_plural = 'Стеновые материалы для использования в расчетах'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class MasonyStrengthSolutions(models.Model):
#     """Модель, представляющая минимальную толщину стен для Обеспечения прочности: требуемая толщина при заданной этажности.  """
#     material = models.ForeignKey(
#         RockWallMaterial, on_delete=models.SET_NULL, null=True, blank=True)

#     mark_m_from = models.ForeignKey(
#         MarkM, help_text='Марка М, от', on_delete=models.SET_NULL, null=True, blank=True)

#     mark_m_to = models.ForeignKey(
#         MarkM, help_text='Марка М, до', on_delete=models.SET_NULL, null=True, blank=True)

#     thickness_mm = models.IntegerField(blank=True, null=True, help_text='Необходимая толщина в мм')

#     FLOORS = (
#         ('1', '1'),
#         ('2', '2'),
#     )

#     floors = models.CharField(
#         max_length=1,
#         choices=FLOORS,
#         default='1',
#         help_text='Выберите этажность',
#     )

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Техническое решение по прочности стены'
#         verbose_name_plural = 'Технические решения по прочности стен'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.identifier})'


class Brand(models.Model):
    """Модель, представляющая бренд товара, материала, например, Wienerberger. То есть, если Porotherm 44 - это trademark самого материала, то Wienerberger - это бренд завода"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите основной бренд, например, Wienerberger')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Основоной бренд'
        verbose_name_plural = 'Основоные бренды'

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

class Algorithm(models.Model):
    """Модель, представляющая алгоритм расчета стены"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Имя переменной, идентификатор для исопльзования в коде')
    name = models.CharField(unique=True, max_length=200,
                            help_text='Название для понимания')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Алгоритм'
        verbose_name_plural = 'Алгоритмы'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.identifier}'


class Factory(models.Model):
    """Модель, представляющая завод - непосредственного производителя материала. Например, Кощаковский завод, Чайковский и т.д. Какой-нибудь местный завод может производить под маркой Wienerberger например"""
    # применяется для быстрой идентификации производителя товара в юзеринтерфейсе, не более того
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите просторе название производителя материала. Например, Кощаковский, Чайковский и т.д.') # точное наименование есть смысл хранить в юрлицах
    city = models.ForeignKey(
        'City', help_text='Выберите город', on_delete=models.SET_NULL, null=True, blank=True)
    brand = models.ForeignKey(
        'Brand', help_text='Выберите бренд (например, Wienerberger), если есть', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Производитель материала'
        verbose_name_plural = 'Производители материалов (конкретные заводы)'

    def __str__(self):
        """String for representing the Model object."""
        f'{self.name}, {self.city}, {self.brand}'


# class BinderSolution(models.Model):
#     """Специальные кладочные растворы, клеи"""
#     name = models.CharField(
#         max_length=200, help_text='Название материала как в спецификации изготовителя')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Специальный кладочный клей, растворы'
#         verbose_name_plural = 'Специальные кладочные клеи, растворы'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class GridUsage(models.Model):
#     """Перечень применения строительных сеток"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')

#     name = models.CharField(
#         max_length=200, help_text='Название применения')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Перечень применения строительных сеток'
#         verbose_name_plural = 'Перечень применения строительных сеток'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class Grid(models.Model):
#     """Модель описывает сетки"""
#     name = models.CharField(
#         max_length=200, help_text='Название сетки как в спецификации изготовителя')

#     usage = models.ManyToManyField(
#         GridUsage, help_text='Выберите применение данной сетки', related_name='secondary_activity')
    
#     brand = models.ForeignKey(
#         'Brand', help_text='Выберите бренд (например, Wienerberger), если есть', on_delete=models.SET_NULL, null=True, blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Сетка'
#         verbose_name_plural = 'Сетки'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class WallReinforcementType(models.Model):
#     """Модель, представляющая тип армирования стены из какого-л материала"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите тип армирования')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Тип армирования'
#         verbose_name_plural = 'Типы армирования'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


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


# class TaxSystemType(models.Model):
#     """Модель, представляющая доступные системы налогообложения"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите наименование системы налогообложения')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Система налогообложения'
#         verbose_name_plural = 'Системы налогообложения'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


class Provider(models.Model):
    """Модель, представляющая бренд, название поставщика: подрядчика, архитектора, продавца. У каждого бренда м.б. магазин, причем как один магазинчик, так и сеть по всей РФ и миру"""
    # каждый поставщик может иметь разные юрлица
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите название постащика, м.б. зарегистрированное или нет')
    primary_activity = models.ForeignKey('Activity', on_delete=models.SET_NULL,
                                         null=True, help_text='Выберите основной вид деятельности', related_name='primary_activity')
    secondary_activity = models.ManyToManyField(
        Activity, help_text='Выберите дополнительные виды деятельности', related_name='secondary_activity')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Поставщик услуг/материалов'
        verbose_name_plural = 'Поставщики услуг/материалов'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class City(models.Model):
    """Модель, представляющая список городов"""
    name = models.CharField(max_length=200,
                            help_text='Введите город')
    region = models.ForeignKey('Region', on_delete=models.CASCADE,
                            help_text='Регион', null=True, blank=True)
    heating_period_duration = models.IntegerField(help_text='Продолжительность отопительного периода, сут. СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 11', null=True, blank=True)  # СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 11, https://www.teplo-info.com/snip/otopitelniy_period
    heating_period_temperature = models.FloatField(help_text='РАЗДЕЛИТЕЛЬ - ТОЧКА. Средняя температура отопительного периода, град. C. столбец 12', null=True, blank=True)  # СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 12, https://www.teplo-info.com/snip/otopitelniy_period
 
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


class DecorativeBrickFace(models.Model):
    """Модель, представляющая названия декоративных граней рядовых кирпичей """
    name = models.CharField(max_length=200,
                            help_text='Название рисунка') 
    brand = models.ManyToManyField('Brand',
                             help_text='Бренд,который делает такой рисунок на своих кирпичах. М.б.несколько', blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Названея декоративной грани рядового кирпича'
        verbose_name_plural = 'Названия декоративных граней рядовых кирпичей'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.brand}'


# class RockWallMaterialStandardSize(models.Model):
#     """Модель описывает стандартный размер общепринятого стенового каменного материала"""
#     # identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#     #                               help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите общепринятую классификацию размера или название')
#     greater_bed_size = models.IntegerField(blank=True, null=True, help_text='Больший размер постели')
#     minor_bed_size = models.IntegerField(blank=True, null=True, help_text='Меньший размер постели')
#     height = models.IntegerField(blank=True, null=True, help_text='Высота')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Размер каменного материала'
#         verbose_name_plural = 'Размеры каменных материалов'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.max_bed_size})'


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


class Insulation(models.Model):
    """Модель описывает утеплители"""
    brand = models.ForeignKey(
        'Brand', help_text='Выберите главный бренд, например, Ursa', on_delete=models.SET_NULL, null=True, blank=True)

    thermal_conductivity = models.FloatField(
        help_text='Введите коэффициент теплопроводности', blank=True, null=True)

    MATTYPE = (
        ('xps', 'XPS'),
        ('rock_wool', 'Минеральная вата'),
    )

    mat_type = models.CharField(
        max_length=9,
        choices=MATTYPE,
        default='xps',
        help_text='Тип утеплителя',
    ) 

    THICK = (
        ('20', '20 мм'),
        ('30', '30 мм'),
        ('50', '50 мм'),
        ('100', '100 мм'),
    )

    thick = models.CharField(
        max_length=3,
        choices=THICK,
        default='20',
        help_text='Толщина',
    ) 

    class Meta:
        ordering = ('brand',)
        verbose_name = 'Утеплитель'
        verbose_name_plural = 'Утеплители'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.brand} ({self.thick})'



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


# class MasonryBonding(models.Model):
#     """Модель хранящая способы скрепления кладки"""
#     name = models.CharField(
#         max_length=200, help_text='Краткое название способа скрепления кладки')

#     MORTAR = (
#         ('cement', 'Цементный раствор'),
#         ('clue', 'Специальный клей'),
#     )

#     mortar = models.CharField(
#         max_length=6,
#         choices=MORTAR,
#         default='cement',
#         help_text='Тип раствора',
#     )
    
#     REINFORCEMENT = (
#         ('metal', 'Металлическая сетка'),
#         ('plastic', 'Пластиковая сетка'),
#         ('armature', 'Металлическая арматура'),
#         ('no', 'Нет'),
#     )

#     reinforcement = models.CharField(
#         max_length=8,
#         choices=REINFORCEMENT,
#         default='metal',
#         help_text='Армирование',
#     )    

#     REINFORCING_BELT = (
#         ('yes', 'Требуется'),
#         ('no', 'Не требуется'),
#     )

#     reinforcing_belt = models.CharField(
#         max_length=3,
#         choices=REINFORCING_BELT,
#         default='no',
#         help_text='Армопояс',
#     )

#     LOAD_DISTRIBUTION = (
#         ('yes', 'Требуется'),
#         ('no', 'Не требуется'),
#     )

#     load_distribution = models.CharField(
#         max_length=3,
#         choices=LOAD_DISTRIBUTION,
#         default='no',
#         help_text='Усиление для распределения нагрузки',
#     )

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Способ скрепления кладки'
#         verbose_name_plural = 'Способы скрепления кладки'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.mortar})'



class RockWallMaterialUnit(models.Model):
    """Модель описывает единицу стенового каменного материала, конкретное изделие конкретного производителя. Но без цены."""

    NAME = (
        ('brick', 'Кирпич'),
        ('rock', 'Камень'),
        ('block', 'Блок'),
    )

    name = models.CharField(
        max_length=5,
        choices=NAME,
        default='brick',
        help_text='Вид изделия',
    )

    MATERIAL = (
        ('ceramic', 'керамический'),
        ('silicate', 'силикатный'),
        ('clinker', 'клинкерный'),
        ('gas_concrete', 'газобетонный'),
        ('ceramsite_concrete', 'керамзитобетонный'),
    )

    material = models.CharField(
        max_length=18,
        choices=MATERIAL,
        default='ceramic',
        help_text='Материал изделия',
    )

    # name = models.CharField(
    #     max_length=200, help_text='Торговое название, если есть', blank=True)
    # size_grid = models.ForeignKey(
    #     RockWallMaterialSizeGrid, help_text='Группа материалов с одинаковой размерной сеткой', on_delete=models.SET_NULL, null=True, blank=True)
    # standard = models.ForeignKey('Standard', on_delete=models.CASCADE,
    #                                   help_text='Если данное изделие соответствует ГОСТ, выберите его', blank=True, null=True)

    # colloquial_name = models.ForeignKey('RockWallMaterialColloquialName', on_delete=models.CASCADE,
    #                                     help_text='Выберите общепринятое название материала', blank=True, null=True)
    # dimension_type = models.ForeignKey('WallMaterialDimensionType', on_delete=models.CASCADE,
    #                                    help_text='Выберите тип тела (полнотелый, пустотелый)', blank=True, null=True)
    # body_type = models.ForeignKey('RockWallMaterialBodyType', on_delete=models.CASCADE,
    #                               help_text='Выберите тип тела (полнотелый, пустотелый)', blank=True, null=True)
    greater_bed_size = models.IntegerField(
        blank=True, null=True, help_text='Больший размер постели (длина), мм. (размер А)')
    minor_bed_size = models.IntegerField(
        blank=True, null=True, help_text='Меньший размер постели (ширина), мм. (размер В)')
    height = models.IntegerField(
        blank=True, null=True, help_text='Высота (толщина), мм. (размер С), или наименьший размер, если постель не очевидна')

    MIN_PICS = (
        ('1', '1'),
        ('1.5', '1,5'),
        ('2', '2'),
        ('2.5', '2,5'),
        ('3', '3'),
        ('no', 'Не применимо'),
    )
    
    min_pix_1_floor = models.CharField(
        max_length=3,
        choices=MIN_PICS,
        default='no',
        help_text='Минимальная тощина в кирпичах для 1 этажного дома',
    )    

    min_pix_2_floor = models.CharField(
        max_length=3,
        choices=MIN_PICS,
        default='no',
        help_text='Минимальная тощина в кирпичах для 2-х этажного дома',
    )
    
    min_pix_3_floor = models.CharField(
        max_length=3,
        choices=MIN_PICS,
        default='no',
        help_text='Минимальная тощина в кирпичах для 3-х этажного дома',
    )

    WORK_SIZE = (
        ('a', 'А'),
        ('b', 'В'),
        ('c', 'С'),
        ('no', 'Нет'),
    )

    NUM_FLOORS = (
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('0', 'Нет'),
    )

    work_size_1 = models.CharField(
        max_length=2,
        choices=WORK_SIZE,
        default='no',
        help_text='Выберите первый рабочий размер, если есть',
    )

    num_floors_on_work_size_1 = models.CharField(
        max_length=1,
        choices=NUM_FLOORS,
        default='0',
        help_text='Сколько этажей можно постороить на этом размере',
    )

    work_size_2 = models.CharField(
        max_length=2,
        choices=WORK_SIZE,
        default='no',
        help_text='Выберите второй рабочий размер, если есть',
    )

    num_floors_on_work_size_2 = models.CharField(
        max_length=1,
        choices=NUM_FLOORS,
        default='0',
        help_text='Сколько этажей можно постороить на этом размере',
    )

    work_size_3 = models.CharField(
        max_length=2,
        choices=WORK_SIZE,
        default='no',
        help_text='Выберите третий рабочий размер, если есть',
    )

    num_floors_on_work_size_3 = models.CharField(
        max_length=1,
        choices=NUM_FLOORS,
        default='0',
        help_text='Сколько этажей можно постороить на этом размере',
    )


    # nf_size = models.ForeignKey('NFSize', help_text='Выбрите размер НФ, которому соответствует изделие',
    #                             on_delete=models.SET_NULL, null=True, blank=True)
    # лишнее. проще определять потом автоматически. но так проще поиск пока сделать
    # quantity_per_pallet = models.IntegerField(
    #     blank=True, null=True, help_text='Количество на поддоне') это пусть каждый продавец пишет

    mark_m = models.ForeignKey(
        MarkM, help_text='Выберите стандартную марку М для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    mark_d = models.ForeignKey(
        MarkD, help_text='Выберите стандартную марку D для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    class_b = models.ForeignKey(
        ClassB, help_text='Выберите стандартный класс В для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    mark_f = models.ForeignKey(
        MarkF, help_text='Выберите стандартную марку морозостойкости F для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    class_average_density = models.ForeignKey(
        ClassАverageDensity, help_text='Выберите стандартный класс средней плотности для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    # masonry_system = models.ForeignKey(
    #     MasonrySystem, help_text='Выберите систему кладки, если есть', on_delete=models.SET_NULL, null=True, blank=True)

    # wall_material_type = models.ManyToManyField(WallMaterialType, help_text='Выберите тип стены, к которому отностится материал')
    # application = models.ManyToManyField(Application, help_text='Выберите область применения материала')
    # binding_solution = models.ManyToManyField(
    #     BinderSolution, help_text='Выберите специальный клей для данного материала', blank=True)
    # bounding = models.ManyToManyField(
    #     MasonryBonding, help_text='Выберите способы скрепления кладки', blank=True)
    thermal_conductivity = models.FloatField(
        help_text='Введите коэффициент теплопроводности', blank=True, null=True)
    factory = models.ForeignKey(
        Factory, help_text='Выберите завод изготовитель', on_delete=models.SET_NULL, null=True, blank=True)
    brand = models.ForeignKey(
        'Brand', help_text='Выберите главный бренд, например, Wienerberger', on_delete=models.SET_NULL, null=True, blank=True)
    sub_brand_1 = models.ForeignKey(
        SubBrand_1, help_text='Выберите наименование внутри бренда (Подбренд 1, если есть), например,  Porotherm', on_delete=models.SET_NULL, null=True, blank=True)
    sub_brand_2 = models.ForeignKey(
        SubBrand_2, help_text='Выберите индекс внутри наименования (Подбренд 2, если есть), например, 44 для поротерма', on_delete=models.SET_NULL, null=True, blank=True)
    algorithm = models.ForeignKey(
        Algorithm, help_text='Выберите алгоритм для расчета', on_delete=models.SET_NULL, null=True, blank=True)

    YN = (
        ('no', 'Нет'),
        ('yes', 'Да'),
    )

    tongue_and_groove  = models.CharField(
        max_length=3,
        choices=YN,
        default='no',
        help_text='Пазогребневая система',
    )    
    
    polish  = models.CharField(
        max_length=3,
        choices=YN,
        default='no',
        help_text='Шлифованный',
    )

    PURPOSE = (
        ('wall', 'Рядовой '),
        ('fasade', 'Лицевой'),
        ('decor_edge', 'Рядовой с декоративной гранью'),
    )

    purpose = models.CharField(
        max_length=10,
        choices=PURPOSE,
        default='wall',
        help_text='Назначение: рядовой, лицевой',
    )  

    face = models.ForeignKey(
        'DecorativeBrickFace', help_text='Выберите название рисунка декоратьивной грани', on_delete=models.SET_NULL, null=True, blank=True)

    PARTITION_OR_BEARING = (
        ('partition', 'Перегородочный'),
        ('bearing', 'Несущий'),
        ('any', 'Любой'),
    )

    partition_or_bearing = models.CharField(
        max_length=9,
        choices=PARTITION_OR_BEARING,
        default='bearing',
        help_text='Для несущих стен, для перегородок или для всего',
    )

    BODY_TYPE = (
        ('solid', 'Полнотелый'),
        ('hollow', 'Пустотелый'),
    )

    body_type = models.CharField(
        max_length=6,
        choices=BODY_TYPE,
        default='solid',
        help_text='Пустотелый или полнотелый',
    )
        
    blind_hollow = models.CharField(
        max_length=3,
        choices=YN,
        default='no',
        help_text='Несквозные пустоты (для полнотелых кирпичей)',
    )

# точные данные хранить только для основных элементов. Доьорные обрабатываются в коде, а здесь они только для цен
    PRIMARY_OR_ADDITIONAL = (
        ('primary', 'Основной'),
        ('additional', 'Доборный'),
    )

    primary_or_additional = models.CharField(
        max_length=10,
        choices=PRIMARY_OR_ADDITIONAL,
        default='primary',
        help_text='Тип элемента: основной или доборный',
    ) 

    
    # THICKNESS_CALC = (
    #     ('mm', 'Только мм'),
    #     ('both', 'И мм. и шт.'),
    # )

    # thickness_calc = models.CharField(
    #     max_length=4,
    #     choices=THICKNESS_CALC,
    #     default='mm',
    #     help_text='Толщину стены можно считать в мм. и в штуках (н.р. в кирпичах) или строго в мм. (для материалов, которые можно ложить разными сторонами)',
    # )

    class Meta:
        verbose_name = 'Единица стенового материала'
        verbose_name_plural = 'Единицы стеновых материалов'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.id}, {self.algorithm.identifier}, {self.factory.name}, {self.name}, {self.material}, {self.greater_bed_size}, {self.minor_bed_size}, {self.height}, {self.purpose}'

    def get_absolute_url(self):
        """Returns the url to access a detail record for this material."""
        return reverse('rock-wall-material-detail', args=[str(self.id)])


class RockWallMaterialPrice(models.Model):
    """Модель, представляющая запись с ценой. Содержит единицу общепринятого товара, но принадлежащую какому-то продавцу"""
    price = models.FloatField()
    name = models.ForeignKey('RockWallMaterialUnit', on_delete=models.CASCADE)
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
    name = models.ForeignKey('Insulation', on_delete=models.CASCADE)
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Цены утеплители'
        verbose_name_plural = 'Цены утеплители'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.price}, {self.owner}'


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


# class Customization(models.Model):
#     """Модель, представляющая индивидуальные настройки для проекта, привязанные к самому проекту или к пользователю"""
#     # У пользователя может быть множество кастомизаций, по которым он сравнивает проекты. У проекта - только одна.
#     name = models.CharField(max_length=200)
#     owner = models.ForeignKey(
#         User, on_delete=models.SET_NULL, null=True, blank=True)

#     class Meta:
#         verbose_name = 'Индивидуальные настройки проекта'
#         verbose_name_plural = 'Индивидуальные настройки проектов'

#     def __str__(self):
#         """String for representing the Plan object."""
#         return self.name

#     def get_absolute_url(self):
#         """Returns the url to access a detail record for this Plan."""
#         return reverse('plan-detail', args=[str(self.id)])


class Plan(models.Model):
    """Модель, представляющая Информацию о проекте"""
    title = models.CharField(max_length=200)
    # Автор проекта. Если копировать один и тот же проект автор не меняется!
    scheme = JSONField(null=True, blank=True)
    author = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Автор')
    checked = models.BooleanField(default=False) # проверен проект или нет. Проверенные доступны к выкладыванию в системе. Расчет происходит при выкладывании
    # Кастомизация проекта. Если нет, то нет. Если есть, то высчитываем цену.
    # customization = models.ForeignKey(
    #     Customization, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Кастомизация')

    # paddingX = models.IntegerField(null=True, blank=True)
    # paddingY = models.IntegerField(null=True, blank=True)
    # scheme_scale = models.FloatField(
        # null=True, blank=True, verbose_name='Масштаб схемы')

    class Meta:
        verbose_name = 'Проект'
        verbose_name_plural = 'Проекты'

    def __str__(self):
        """String for representing the Plan object."""
        return self.title

    def get_absolute_url(self):
        """Returns the url to access a detail record for this Plan."""
        return reverse('plan-detail', args=[str(self.id)])

# Расширение модели пользователя для хранения настроек


class Profile(models.Model):
    # user = models.OneToOneField(settings.AUTH_USER_MODEL,
    #                             on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                                on_delete=models.CASCADE)
    
    city = models.ForeignKey(
        City, help_text='Выберите город', on_delete=models.SET_NULL, null=True, blank=True)

    provider = models.ManyToManyField('Provider',
                             help_text='Выберите поставщика, которому принадлежит этот офис,торговая точка', blank=True)

    class Meta:
        verbose_name = 'Профиль пользователя'
        verbose_name_plural = 'Профили пользователей'

    def __str__(self):
        return 'Профиль пользователя {}'.format(self.user.username)

class PlanCityCost(models.Model):
    """Модель используется для хранения минимальных цен на строительство проектов для быстрого поиска"""
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE, null=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, null=True)
    material = models.ForeignKey(RockWallMaterialUnit, on_delete=models.CASCADE, null=True)   
    cost = models.IntegerField(blank=True, null=True)

    class Meta:
        ordering = ['material', 'cost'] 
        verbose_name = 'Минимальная цена строительства'
        verbose_name_plural = 'Минимальные цены строительства'

    def __str__(self):
        return self.title
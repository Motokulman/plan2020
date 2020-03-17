from django.db import models
from django.conf import settings
from suppliers.models import Provider
from suppliers.models import Manufacturer
from geography.models import City
from brands.models import Brand
from names.models import *
from materials.models import *
# from materials.models import *
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


# class Brand(models.Model):
#     """Модель, представляющая бренд товара, материала, например, Wienerberger. То есть, если Porotherm 44 - это trademark самого материала, то Wienerberger - это бренд завода"""
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите основной бренд, например, Wienerberger')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Основоной бренд'
#         verbose_name_plural = 'Основоные бренды'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class SubBrand_1(models.Model):
#     """Модель, представляющая торговую марку, например, Porotherm,  и т.д."""
#     brand = models.ForeignKey(
#         'Brand', on_delete=models.CASCADE, null=True)
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите торговую марку внутри бренда, например, Porotherm и т.д.')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Подбренд 1)'
#         verbose_name_plural = 'Подбренды 1)'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class SubBrand_2(models.Model):
#     """Модель, представляющая индекс серии товаров внутри торговой марки что внутри бренда"""
#     sub_brand_1 = models.ForeignKey('SubBrand_1', on_delete=models.CASCADE)
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите индекс серии товаров внутри торговой марки что внутри бренда, если она есть')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Подбренд 2)'
#         verbose_name_plural = 'Подбренды 2)'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name

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


# class Factory(models.Model):
#     """Модель, представляющая завод - непосредственного производителя материала. Например, Кощаковский завод, Чайковский и т.д. Какой-нибудь местный завод может производить под маркой Wienerberger например"""
#     # применяется для быстрой идентификации производителя товара в юзеринтерфейсе, не более того
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите просторе название производителя материала. Например, Кощаковский, Чайковский и т.д.') # точное наименование есть смысл хранить в юрлицах
#     city = models.ForeignKey(
#         'City', help_text='Выберите город', on_delete=models.SET_NULL, null=True, blank=True)
#     brand = models.ForeignKey(
#         'Brand', help_text='Выберите бренд (например, Wienerberger), если есть', on_delete=models.SET_NULL, null=True, blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Производитель материала'
#         verbose_name_plural = 'Производители материалов (конкретные заводы)'

#     def __str__(self):
#         """String for representing the Model object."""
#         f'{self.name}, {self.city}, {self.brand}'


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


# class Activity(models.Model):
#     """Модель, представляющая доступные наименования видов деятельности: проектирование, строительный подряд, поставка/продажа материалов, юридические услуги"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите наименование вида деятельности')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Вид деятельности'
#         verbose_name_plural = 'Виды деятельности'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


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


# class Provider(models.Model):
#     """Модель, представляющая бренд, название поставщика: подрядчика, архитектора, продавца. У каждого бренда м.б. магазин, причем как один магазинчик, так и сеть по всей РФ и миру"""
#     # каждый поставщик может иметь разные юрлица
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите название постащика, м.б. зарегистрированное или нет')
#     primary_activity = models.ForeignKey('Activity', on_delete=models.SET_NULL,
#                                          null=True, help_text='Выберите основной вид деятельности', related_name='primary_activity')
#     secondary_activity = models.ManyToManyField(
#         Activity, help_text='Выберите дополнительные виды деятельности', related_name='secondary_activity')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Поставщик услуг/материалов'
#         verbose_name_plural = 'Поставщики услуг/материалов'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class City(models.Model):
#     """Модель, представляющая список городов"""
#     name = models.CharField(max_length=200,
#                             help_text='Введите город')
#     region = models.ForeignKey('Region', on_delete=models.CASCADE,
#                             help_text='Регион', null=True, blank=True)
#     heating_period_duration = models.IntegerField(help_text='Продолжительность отопительного периода, сут. СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 11', null=True, blank=True)  # СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 11, https://www.teplo-info.com/snip/otopitelniy_period
#     heating_period_temperature = models.FloatField(help_text='РАЗДЕЛИТЕЛЬ - ТОЧКА. Средняя температура отопительного периода, град. C. столбец 12', null=True, blank=True)  # СНиП 23-01-99 "Строительная климатология и геофизика". См. Таблица 1, столбец 12, https://www.teplo-info.com/snip/otopitelniy_period
 
#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Город'
#         verbose_name_plural = 'Города'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name

# class Country(models.Model):
#     """Модель, представляющая список стран"""
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите страну', null=True, blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Страна'
#         verbose_name_plural = 'Страны'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name

# class Region(models.Model):
#     """Модель, представляющая список регионов стран"""
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите регион')    
#     code = models.IntegerField(unique=True,
#                             help_text='Цифровой код региона', null=True, blank=True)
#     country = models.ForeignKey('Country', on_delete=models.CASCADE,
#                             help_text='Страна', null=True, blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Регион'
#         verbose_name_plural = 'Регионы'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class DecorativeBrickFace(models.Model):
#     """Модель, представляющая названия декоративных граней рядовых кирпичей """
#     name = models.CharField(max_length=200,
#                             help_text='Название рисунка') 
#     brand = models.ManyToManyField('Brand',
#                              help_text='Бренд,который делает такой рисунок на своих кирпичах. М.б.несколько', blank=True)

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Названея декоративной грани рядового кирпича'
#         verbose_name_plural = 'Названия декоративных граней рядовых кирпичей'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name}, {self.brand}'


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

    # provider = models.ManyToManyField('Provider',
    #                          help_text='Выберите поставщика, которому принадлежит этот офис,торговая точка', blank=True)

    class Meta:
        verbose_name = 'Профиль пользователя'
        verbose_name_plural = 'Профили пользователей'

    def __str__(self):
        return 'Профиль пользователя {}'.format(self.user.username)

# class PlanCityCost(models.Model):
#     """Модель используется для хранения минимальных цен на строительство проектов для быстрого поиска"""
#     plan = models.ForeignKey(Plan, on_delete=models.CASCADE, null=True)
#     city = models.ForeignKey(City, on_delete=models.CASCADE, null=True)
#     material = models.ForeignKey(RockWallMaterialUnit, on_delete=models.CASCADE, null=True)   
#     cost = models.IntegerField(blank=True, null=True)

#     class Meta:
#         ordering = ['material', 'cost'] 
#         verbose_name = 'Минимальная цена строительства'
#         verbose_name_plural = 'Минимальные цены строительства'

#     def __str__(self):
#         return self.title
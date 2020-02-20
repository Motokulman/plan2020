from django.db import models
from django.conf import settings
# Used to generate URLs by reversing the URL patterns
from django.urls import reverse
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import User

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

# class RockMaterialTech(models.Model):
#     """Модель, представляющая технологию производства каменного стенового материала, например, газобетон, полнотелый, керамический"""
#     identifier = models.CharField(unique = True, default = 'default_identifier', max_length=200, help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(max_length=200, help_text='Введите технологию производства каменного стенового материала, например, газобетон, полнотелый, керамический')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Технология производства материала'
#         verbose_name_plural = 'Технологии производства материалов'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class WallMaterialType(models.Model):
#     """Модель, представляющая тип стен дома. Используется для выбора материала несущей части стены """
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите тип материала стены с точки зрения пользователя: кирпич полнотелый, газобетон и т.д.')

#     COMMON_TYPE = (
#         ('r', 'Каменый'),
#         ('w', 'Деревянный'),
#     )

#     common_wall_type = models.CharField(
#         max_length=1,
#         choices=COMMON_TYPE,
#         default='r',
#         help_text='Выберите: деревянный или каменный',
#     )

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Тип несущей части стены'
#         verbose_name_plural = 'Типы несущей части стены'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.identifier})'


class ProductBrand(models.Model):
    """Модель, представляющая бренд товара, материала, например, Wienerberger. То есть, если Porotherm 44 - это trademark самого материала, то Wienerberger - это бренд завода"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите бренд, например, Wienerberger')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Бренд'
        verbose_name_plural = 'Бренды'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


# class TradeMark(models.Model):
#     """Модель, представляющая торговую марку, например, Porotherm, Kerama и т.д."""
#     brand = models.ForeignKey(
#         'ProductBrand', on_delete=models.CASCADE, null=True)
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите торговую марку, например, Porotherm, Kerama и т.д.')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Торговая марка'
#         verbose_name_plural = 'Торговые марки'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


# class TradeMarkSeries(models.Model):
#     """Модель, представляющая серию товаров какой либо торговой марки"""
#     trademark = models.ForeignKey('TradeMark', on_delete=models.CASCADE)
#     name = models.CharField(unique=True, max_length=200,
#                             help_text='Введите название серии товаров, если она есть')

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Товарная серия'
#         verbose_name_plural = 'Товарные серии (какой-либо марки)'

#     def __str__(self):
#         """String for representing the Model object."""
#         return self.name


class Producer(models.Model):
    """Модель, представляющая завод - непосредственного производителя материала. Например, Кощаковский завод, Чайковский и т.д. Какой-нибудь местный завод может производить под маркой Wienerberger например"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите производителя материала. Например, Кощаковский завод, Чайковский и т.д.')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Производитель материала'
        verbose_name_plural = 'Производители материалов (конкретные заводы)'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class BinderSolution(models.Model):
    """Специальные кладочные растворы, клеи"""
    name = models.CharField(
        max_length=200, help_text='Название материала как в спецификации изготовителя')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Специальный кладочный клей, растворы'
        verbose_name_plural = 'Специальные кладочные клеи, растворы'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class GridUsage(models.Model):
    """Перечень применения строительных сеток"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')

    name = models.CharField(
        max_length=200, help_text='Название применения')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Перечень применения строительных сеток'
        verbose_name_plural = 'Перечень применения строительных сеток'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class Grid(models.Model):
    """Модель описывает сетки"""
    name = models.CharField(
        max_length=200, help_text='Название сетки как в спецификации изготовителя')

    usage = models.ManyToManyField(
        GridUsage, help_text='Выберите применение данной сетки', related_name='secondary_activity')
    
    brand = models.ForeignKey(
        'ProductBrand', help_text='Выберите бренд (например, Wienerberger), если есть', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Сетка'
        verbose_name_plural = 'Сетки'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class WallReinforcementType(models.Model):
    """Модель, представляющая тип армирования стены из какого-л материала"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=200, help_text='Введите тип армирования')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Тип армирования'
        verbose_name_plural = 'Типы армирования'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class ProviderActivityType(models.Model):
    """Модель, представляющая доступные наименования видов деятельности: проектирование, строительный подряд, поставка/продажа материалов, юридические услуги"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=200, help_text='Введите наименование вида деятельности')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Доступный вид деятельности'
        verbose_name_plural = 'Доступные виды деятельности'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class TaxSystemType(models.Model):
    """Модель, представляющая доступные системы налогообложения"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(
        max_length=200, help_text='Введите наименование системы налогообложения')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Система налогообложения'
        verbose_name_plural = 'Системы налогообложения'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class Provider(models.Model):
    """Модель, представляющая бренд, название поставщика: подрядчика, архитектора, продавца. У каждого бренда м.б. магазин, причем как один магазинчик, так и сеть по всей РФ и миру"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите бренд продавца')
    primary_activity = models.ForeignKey('ProviderActivityType', on_delete=models.SET_NULL,
                                         null=True, help_text='Выберите основной вид деятельности', related_name='primary_activity')
    secondary_activity = models.ManyToManyField(
        ProviderActivityType, help_text='Выберите дополнительные виды деятельности', related_name='secondary_activity')
    tax_system = models.ManyToManyField(
        TaxSystemType, help_text='Выберите применяемые Вами системы налообложения (можно несколько)')

    # Форма собственности
    OWNERSHIP_FORM = (
        ('p', 'Частное лицо'),
        ('c', 'Компания'),
    )

    ownership_form = models.CharField(
        max_length=1,
        choices=OWNERSHIP_FORM,
        default='p',
        help_text='Выберите форму собственности',
    )

    class Meta:
        ordering = ('name',)
        verbose_name = 'Поставщик услуг/материалов'
        verbose_name_plural = 'Поставщики услуг/материалов'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class City(models.Model):
    """Модель, представляющая список городов"""
    name = models.CharField(unique=True, max_length=200,
                            help_text='Введите город')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Город'
        verbose_name_plural = 'Города'

    def __str__(self):
        """String for representing the Model object."""
        return self.name


class ProviderOutlet(models.Model):
    """Модель, представляющая конкретный магазин или офис поставщика услуг/материалов. Он может быть один (ИП Иванов) или один из сети "Леруа" """
    name = models.ForeignKey('Provider', on_delete=models.CASCADE,
                             help_text='Выберите поставщика, которому принадлежит этот офис,торговая точка')
    local_name = models.CharField(
        max_length=200, blank=True, help_text='Введите уточняющее название офиса или торговой точки. Например, Офис на Московской ')
    city = models.ForeignKey('City', on_delete=models.CASCADE)
    information = models.TextField(
        max_length=200, help_text='Контакты, адрес и т.д. продавца')
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Торговая точка/офис'
        verbose_name_plural = 'Торговые точки/офисы'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name.name} ({self.city.name}). {self.local_name}'


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


class ClassBLight(models.Model):
    """Модель описывает классы материалов с индексом В. Обычно это марка бетона, газобетона. Например, В3,5 или В20"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(max_length=5, help_text='Введите класс В')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Класс В легкого бетона'
        verbose_name_plural = 'Классы В легких бетонов'

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


# class Standard(models.Model):
#     """Модель описывает строительные госты"""
#     name = models.CharField(max_length=200, help_text='Введите наименование ГОСТ')
#     standard_area = models.ManyToManyField(StandardArea, help_text="Выберите сферы применения данного ГОСТ")

#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'ГОСТ'
#         verbose_name_plural = 'ГОСТ'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.identifier})'



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


class MasonryBonding(models.Model):
    """Модель хранящая способы скрепления кладки"""
    name = models.CharField(
        max_length=200, help_text='Краткое название способа скрепления кладки')

    MORTAR = (
        ('cement', 'Цементный раствор'),
        ('clue', 'Специальный клей'),
    )

    mortar = models.CharField(
        max_length=6,
        choices=MORTAR,
        default='cement',
        help_text='Тип раствора',
    )
    
    REINFORCEMENT = (
        ('metal', 'Металлическая сетка'),
        ('plastic', 'Пластиковая сетка'),
        ('armature', 'Металлическая арматура'),
        ('no', 'Нет'),
    )

    reinforcement = models.CharField(
        max_length=8,
        choices=REINFORCEMENT,
        default='metal',
        help_text='Армирование',
    )    

    REINFORCING_BELT = (
        ('yes', 'Требуется'),
        ('no', 'Не требуется'),
    )

    reinforcing_belt = models.CharField(
        max_length=3,
        choices=REINFORCING_BELT,
        default='no',
        help_text='Армопояс',
    )

    LOAD_DISTRIBUTION = (
        ('yes', 'Требуется'),
        ('no', 'Не требуется'),
    )

    load_distribution = models.CharField(
        max_length=3,
        choices=LOAD_DISTRIBUTION,
        default='no',
        help_text='Усиление для распределения нагрузки',
    )

    class Meta:
        ordering = ('name',)
        verbose_name = 'Способ скрепления кладки'
        verbose_name_plural = 'Способы скрепления кладки'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.mortar})'


# class RockWallMaterialSizeGrid(models.Model):
#     """Модель, содержащая названия размерных сеток"""
#     identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
#                                   help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
#     name = models.CharField(
#         max_length=200, help_text='Введите название группы материалов с одинаковой размерной сеткой')


#     class Meta:
#         ordering = ('name',)
#         verbose_name = 'Группа материалов с одинаковой размерной сеткой'
#         verbose_name_plural = 'Группы материалов с одинаковой размерной сеткой'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.identifier})'

class PorothermSystem(models.Model):
    """Модель описывает системы кладок Porotherm"""
    identifier = models.CharField(unique=True, default='default_identifier', max_length=200,
                                  help_text='Уникальный неизменяемый идентификатор (только латинские символы)')
    name = models.CharField(max_length=200, help_text='Наименование системы кладки, например, Porotherm 44, Porotherm 38')

    class Meta:
        ordering = ('name',)
        verbose_name = 'Система кладки Porotherm'
        verbose_name_plural = 'Системы кладки Porotherm'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.identifier})'


class RockWallMaterialUnit(models.Model):
    """Модель описывает единицу стенового каменного материала, конкретное изделие конкретного производителя. Но без цены."""

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
        blank=True, null=True, help_text='Больший размер постели (длина), мм')
    minor_bed_size = models.IntegerField(
        blank=True, null=True, help_text='Меньший размер постели (ширина), мм')
    height = models.IntegerField(
        blank=True, null=True, help_text='Высота (толщина), мм, или наименьший размер, если постель не очевидна')
    nf_size = models.ForeignKey('NFSize', help_text='Выбрите размер НФ, которому соответствует изделие',
                                on_delete=models.SET_NULL, null=True, blank=True)
    # лишнее. проще определять потом автоматически. но так проще поиск пока сделать
    quantity_per_pallet = models.IntegerField(
        blank=True, null=True, help_text='Количество на поддоне')

    mark_m = models.ForeignKey(
        MarkM, help_text='Выберите стандартную марку М для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    mark_d = models.ForeignKey(
        MarkD, help_text='Выберите стандартную марку D для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    class_b = models.ForeignKey(
        ClassBLight, help_text='Выберите стандартный класс В для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    mark_f = models.ForeignKey(
        MarkF, help_text='Выберите стандартную марку морозостойкости F для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    class_average_density = models.ForeignKey(
        ClassАverageDensity, help_text='Выберите стандартный класс средней плотности для данного материала, если есть', on_delete=models.SET_NULL, null=True, blank=True)
    # masonry_system = models.ForeignKey(
    #     MasonrySystem, help_text='Выберите систему кладки, если есть', on_delete=models.SET_NULL, null=True, blank=True)

    # wall_material_type = models.ManyToManyField(WallMaterialType, help_text='Выберите тип стены, к которому отностится материал')
    # application = models.ManyToManyField(Application, help_text='Выберите область применения материала')
    binding_solution = models.ManyToManyField(
        BinderSolution, help_text='Выберите специальный клей для данного материала', blank=True)
    bounding = models.ManyToManyField(
        MasonryBonding, help_text='Выберите способы скрепления кладки', blank=True)
    thermal_conductivity = models.IntegerField(
        help_text='Введите коэффициент теплопроводности', blank=True, null=True)
    producer = models.ForeignKey(
        'Producer', help_text='Выберите завод изготовитель', on_delete=models.SET_NULL, null=True, blank=True)
    brand = models.ForeignKey(
        'ProductBrand', help_text='Выберите бренд, например, Porotherm', on_delete=models.SET_NULL, null=True, blank=True)
    porotherm_system = models.ManyToManyField(
        PorothermSystem, help_text='Выберите конкретную систему для Porotherm', blank=True)
    # trade_mark = models.ForeignKey(
    #     'TradeMark', help_text='Выберите торговую марку изделия (например, Porotherm 44)', on_delete=models.SET_NULL, null=True, blank=True)

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
        ('clay', 'глиняный'),
        ('silicate', 'силикатный'),
        ('gas_concrete', 'газобетонный'),
        ('ceramsite_concrete', 'керамзитобетонный'),
    )

    material = models.CharField(
        max_length=18,
        choices=MATERIAL,
        default='clay',
        help_text='Материал изделия',
    )

    YN = (
        ('no', 'Нет'),
        ('yes', 'Да'),
    )

    double_install = models.CharField(
        max_length=3,
        choices=YN,
        default='no',
        help_text='Допустима ли установка и на постель и на ребро',
    )

    clinker  = models.CharField(
        max_length=3,
        choices=YN,
        default='no',
        help_text='Клинкерный кирпич',
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

    WORK_SIZE = (
        ('greater', 'Только больший размер'),
        ('minor', 'Только меньший размер постели'),
        ('both', 'Оба размера постели'),
        ('any', 'Любой'),
    )

    work_size = models.CharField(
        max_length=7,
        choices=WORK_SIZE,
        default='greater',
        help_text='Какой размер формирует толщину стены',
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

    # SIZE_TYPE = (
    #     ('brick', 'Кирпич'),
    #     ('block', 'Блок'),
    # )

    # size_type = models.CharField(
    #     max_length=5,
    #     choices=SIZE_TYPE,
    #     default='brick',
    #     help_text='Типоразмер: кирпич или блок',
    # )

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

    
    THICKNESS_CALC = (
        ('mm', 'Только мм'),
        ('both', 'И мм. и шт.'),
    )

    thickness_calc = models.CharField(
        max_length=4,
        choices=THICKNESS_CALC,
        default='mm',
        help_text='Толщину стены можно считать в мм. и в штуках (н.р. в кирпичах) или строго в мм. (для материалов, которые можно ложить разными сторонами)',
    )

    class Meta:
        verbose_name = 'Единица стенового материала'
        verbose_name_plural = 'Единицы стеновых материалов'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name}, {self.material}, {self.greater_bed_size}, {self.minor_bed_size}, {self.height}'

    def get_absolute_url(self):
        """Returns the url to access a detail record for this material."""
        return reverse('rock-wall-material-detail', args=[str(self.id)])


class RockWallMaterialPricePosition(models.Model):
    """Модель, представляющая запись с ценой. Содержит единицу общепринятого товара, но принадлежащую какому-то продавцу"""
    price = models.FloatField()
    name = models.ForeignKey('RockWallMaterialUnit', on_delete=models.CASCADE)
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'Ценовая позиция'
        verbose_name_plural = 'Ценовые позиции'

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


class Customization(models.Model):
    """Модель, представляющая индивидуальные настройки для проекта, привязанные к самому проекту или к пользователю"""
    # У пользователя может быть множество кастомизаций, по которым он сравнивает проекты. У проекта - только одна.
    name = models.CharField(max_length=200)
    owner = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        verbose_name = 'Индивидуальные настройки проекта'
        verbose_name_plural = 'Индивидуальные настройки проектов'

    def __str__(self):
        """String for representing the Plan object."""
        return self.name

    def get_absolute_url(self):
        """Returns the url to access a detail record for this Plan."""
        return reverse('plan-detail', args=[str(self.id)])


class Plan(models.Model):
    """Модель, представляющая Информацию о проекте"""
    title = models.CharField(max_length=200)
    # Автор проекта. Если копировать один и тот же проект автор не меняется!
    author = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Автор')
    # Кастомизация проекта. Если нет, то нет. Если есть, то высчитываем цену.
    customization = models.ForeignKey(
        Customization, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Кастомизация')

    # paddingX = models.IntegerField(null=True, blank=True)
    # paddingY = models.IntegerField(null=True, blank=True)
    scheme_scale = models.FloatField(
        null=True, blank=True, verbose_name='Масштаб схемы')

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
    user = models.OneToOneField(settings.AUTH_USER_MODEL,
                                on_delete=models.CASCADE)
    scheme_scale = models.IntegerField(
        blank=True, null=True, default=25, verbose_name='Начальный масштаб схемы')

    class Meta:
        verbose_name = 'Профиль пользователя'
        verbose_name_plural = 'Профили пользователей'

    def __str__(self):
        return 'Profile for user {}'.format(self.user.username)

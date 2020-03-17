from django.db import models
from django.conf import settings
from catalog.models import *
# from catalog.models import Algorithm
from brands.models import *
from standards.models import *
from names.models import *

class BulkSand(models.Model):
    """Песок россыпью в самосвалах"""
    
    NAME = (
        ('quarry', 'Карьерный'),
        ('river', 'Речной'),
    )
    name = models.CharField(
        max_length=6,
        choices=NAME,
        default='quarry',
        help_text='Тип песка',
    )    
    weight = models.IntegerField(help_text='Масса песка в грузовике, тонн')

    class Meta:
        ordering = ('name', 'weight')
        verbose_name = 'Песок россыпью в самосвалах'
        verbose_name_plural = 'Песок россыпью в самосвалах'

    def __str__(self):
        """String for representing the Model object."""
        return f'{self.name} ({self.weight}) тонн'

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

    # MIN_PICS = (
    #     ('1', '1'),
    #     ('1.5', '1,5'),
    #     ('2', '2'),
    #     ('2.5', '2,5'),
    #     ('3', '3'),
    #     ('no', 'Не применимо'),
    # )
    
    # min_pix_1_floor = models.CharField(
    #     max_length=3,
    #     choices=MIN_PICS,
    #     default='no',
    #     help_text='Минимальная тощина в кирпичах для 1 этажного дома',
    # )    

    # min_pix_2_floor = models.CharField(
    #     max_length=3,
    #     choices=MIN_PICS,
    #     default='no',
    #     help_text='Минимальная тощина в кирпичах для 2-х этажного дома',
    # )
    
    # min_pix_3_floor = models.CharField(
    #     max_length=3,
    #     choices=MIN_PICS,
    #     default='no',
    #     help_text='Минимальная тощина в кирпичах для 3-х этажного дома',
    # )

    # WORK_SIZE = (
    #     ('a', 'А'),
    #     ('b', 'В'),
    #     ('c', 'С'),
    #     ('no', 'Нет'),
    # )

    # NUM_FLOORS = (
    #     ('1', '1'),
    #     ('2', '2'),
    #     ('3', '3'),
    #     ('0', 'Нет'),
    # )

    # work_size_1 = models.CharField(
    #     max_length=2,
    #     choices=WORK_SIZE,
    #     default='no',
    #     help_text='Выберите первый рабочий размер, если есть',
    # )

    # num_floors_on_work_size_1 = models.CharField(
    #     max_length=1,
    #     choices=NUM_FLOORS,
    #     default='0',
    #     help_text='Сколько этажей можно постороить на этом размере',
    # )

    # work_size_2 = models.CharField(
    #     max_length=2,
    #     choices=WORK_SIZE,
    #     default='no',
    #     help_text='Выберите второй рабочий размер, если есть',
    # )

    # num_floors_on_work_size_2 = models.CharField(
    #     max_length=1,
    #     choices=NUM_FLOORS,
    #     default='0',
    #     help_text='Сколько этажей можно постороить на этом размере',
    # )

    # work_size_3 = models.CharField(
    #     max_length=2,
    #     choices=WORK_SIZE,
    #     default='no',
    #     help_text='Выберите третий рабочий размер, если есть',
    # )

    # num_floors_on_work_size_3 = models.CharField(
    #     max_length=1,
    #     choices=NUM_FLOORS,
    #     default='0',
    #     help_text='Сколько этажей можно постороить на этом размере',
    # )


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
    # thermal_conductivity = models.FloatField(
    #     help_text='Введите коэффициент теплопроводности', blank=True, null=True)
    manufacturer = models.ForeignKey(
        Manufacturer, help_text='Выберите завод изготовитель', on_delete=models.SET_NULL, null=True, blank=True)
    brand = models.ForeignKey(
        Brand, help_text='Выберите главный бренд, например, Wienerberger', on_delete=models.SET_NULL, null=True, blank=True)
    sub_brand_1 = models.ForeignKey(
        SubBrand_1, help_text='Выберите наименование внутри бренда (Подбренд 1, если есть), например,  Porotherm', on_delete=models.SET_NULL, null=True, blank=True)
    sub_brand_2 = models.ForeignKey(
        SubBrand_2, help_text='Выберите индекс внутри наименования (Подбренд 2, если есть), например, 44 для поротерма', on_delete=models.SET_NULL, null=True, blank=True)
    algorithm = models.ForeignKey(
        'catalog.Algorithm', help_text='Выберите алгоритм для расчета', on_delete=models.SET_NULL, null=True, blank=True)

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
    
    polish = models.CharField(
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
        DecorativeBrickFace, help_text='Выберите название рисунка декоратьивной грани', on_delete=models.SET_NULL, null=True, blank=True)

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
        return f'{self.id}, {self.algorithm.identifier}, {self.manufacturer.name}, {self.name}, {self.material}, {self.greater_bed_size}, {self.minor_bed_size}, {self.height}, {self.purpose}'

    def get_absolute_url(self):
        """Returns the url to access a detail record for this material."""
        return reverse('rock-wall-material-detail', args=[str(self.id)])


class Insulation(models.Model):
    """Модель описывает утеплители"""
    brand = models.ForeignKey(
        Brand, help_text='Выберите главный бренд, например, Ursa', on_delete=models.SET_NULL, null=True, blank=True)

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



# class Cement(models.Model):
#     """Цемент"""
    
#     NAME = (
#         ('quarry', 'Карьерный'),
#         ('river', 'Речной'),
#     )
#     name = models.CharField(
#         max_length=6,
#         choices=NAME,
#         default='quarry',
#         help_text='Тип песка',
#     )    
#     weight = models.IntegerField(help_text='Масса песка в грузовике')

#     class Meta:
#         ordering = ('name', 'weight')
#         verbose_name = 'Песок россыпью в самосвалах'
#         verbose_name_plural = 'Песок россыпью в самосвалах'

#     def __str__(self):
#         """String for representing the Model object."""
#         return f'{self.name} ({self.weight}) тонн'
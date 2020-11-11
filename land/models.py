from django.db import models
from django.conf import settings
from account.models import Profile
from legal.models import LegalEntity
from django.contrib.auth.models import User
from django.urls import reverse

class Land(models.Model):
    """Земельные участки"""
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Собственник участка') # пока сделаем, что пользователь может быть только один.

    # Иначе пока не решен вопрос иньеграции с БД росреестра возможна ситуация, когда некто добавит себе все участки и только он будет иметь к ним доступ
    cottage_community = models.OneToOneField('CottageCommunity', verbose_name='Коттеджный посёлок', on_delete=models.SET_NULL, blank=True, null=True) 
    # cadastral_district = models.IntegerField(help_text='Кадастроый округ. Два знака')
    # cadastral_area = models.IntegerField(help_text='Кадастровый район. Два знака')
    # cadastral_quarter = models.IntegerField(help_text='Кадастровый квартал. Семь знаков')
    # cadastral_land_number = models.IntegerField(help_text='Кадастровый номер участка в квартале. 0-4 знака')  
    cadastral_number = models.CharField(max_length=20, verbose_name='Кадастровый номер') 

    class Meta:
        verbose_name = 'Участок'
        verbose_name_plural = 'Участки'
    
    def __str__(self):
        return f'Кадастровый номер {self.cadastral_number}, Коттеджный поселок: {self.cottage_community}, собственник: {self.owner}  '

    def get_absolute_url(self):
        """Returns the url to access a detail record for this Land."""
        return reverse('land_detail', args=[str(self.id)])



# class Owners(models.Model):
#     """Собственники земельных участков. Пока не надо, думаю"""
#     owner = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
#     # share = models.IntegerField(help_text='Доля в виде знаменателя единичной дроби. То есть если доля 1/3, введите 3')

#     def __str__(self):
#         return f'{self.owner.name} (1/{self.share}) '


class CottageCommunity(models.Model): 
    """Коттеджные поселки"""
    name = models.CharField(max_length=200, verbose_name='Название коттежного поселка')
    clarify = models.CharField(max_length=200, verbose_name='Уточнение на случай, если КП с таким названием несколько')
    # management_company = models.OneToOneField(LegalEntity, blank=True, null=True, help_text='Управляющая компания, юридическое лицо')

    def __str__(self):
        return f' Коттеджный поселок{self.name} ({self.clarify}) '


class Survey(models.Model):
    """Геологическое исследование"""
    land = models.ForeignKey(Land, on_delete=models.CASCADE, null=True, verbose_name='Участок') # исполнитель  - организация, проводящая исследование
    contractor = models.ForeignKey(User, related_name='contractor', on_delete=models.SET_NULL, null=True, verbose_name='Пользователь-исполнитель', help_text='Есть резон хранить и пользователя и организацию, от имени которой он проводит исследование') # исполнитель  - организация, проводящая исследование
    legal_entity = models.ForeignKey(LegalEntity, related_name='legal_entity', on_delete=models.SET_NULL, null=True, verbose_name='Организация-исполнитель', help_text='Есть резон хранить и пользователя и организацию, от имени которой он проводит исследование') # исполнитель  - организация, проводящая исследование
    customer = models.ForeignKey(User, related_name='customer', on_delete=models.SET_NULL, null=True, verbose_name='Заказчик изыскания', help_text='Сделать здесь поиск пользователя по номеру телефона') # заказчик
    # private_customer = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True) # заказчик - частное лицо
    # legal_customer = models.OneToOneField(LegalEntity, on_delete=models.SET_NULL, null=True) # заказчик - бридическое лицо лицо
    
    class Meta:
        verbose_name = 'Геологическое изыскание'
        verbose_name_plural = 'Геологические изыскания'

    def __str__(self):
        return f'Участок {self.land}, заказчик {self.customer} '

    def get_absolute_url(self):
        return reverse('survey_detail', args=[str(self.id)])


class Well(models.Model): 
    """Скважина геологического исследования"""
    survey = models.ForeignKey(Survey, on_delete=models.CASCADE, related_name='wells', null=True, verbose_name='Геологическое исследование', help_text="Нужно, чтобы при создании скважины не приходилось выбирать исследование. Ведь это скважина для этого исследования")
    number = models.IntegerField(default=1, verbose_name='Порядковый номер скважины')
    height = models.IntegerField(default=0, verbose_name='Высота в сантиметрах устья скважины относительно других скважин, если есть. Самая низкая = 0')
    bearing_resistance_pile_2000_300 = models.FloatField(null=True, blank=True, verbose_name='Несущая способность сваи глубиной 2 метра и диаметром 300мм') # определяется расчетом после получения исследования
        
    class Meta:
        verbose_name = 'Скважина геологического изыскания'
        verbose_name_plural = 'Скважины геологического изыскания'

    def __str__(self):
        return f'Скважина № {self.number} '

    def get_absolute_url(self):
        return reverse('well_detail', args=[str(self.id)])


class Layer(models.Model): 
    """Cлой грунта в скважине"""
    well = models.ForeignKey(Well, on_delete=models.CASCADE, null=True, blank=True, verbose_name='Скважина')
    number = models.IntegerField( verbose_name='Номер слоя в скважине (уникален)')
    power = models.FloatField(default=0, verbose_name='Мощность слоя, в метрах')
    
    YES_OR_NO = (
        ('y', 'Да'),
        ('n', 'Нет'),
    )

    non_consolidated = models.CharField(
        max_length=1,
        choices=YES_OR_NO,
        default='n',
        verbose_name='Насыпной неконсолидированный',
    )

    debris = models.CharField(
        max_length=1,
        choices=YES_OR_NO,
        default='n',
        verbose_name='Крупнообломочный строительный мусор',
    )
    
    SAND_VS_CLAY = (
        ('n', 'Органический'),
        ('s', 'Песок'),
        ('l', 'Супесь/суглинок'),
        ('c', 'Глина'),
    )
    sand_vs_clay = models.CharField(
        max_length=1,
        choices=SAND_VS_CLAY,
        default='n',
        verbose_name='Описание грунта инженерного слоя',
    )

    SAND = (
        ('n', 'Ничего из перечисленного'),
        ('c', 'Крупный и средней крупности песок'),
        ('f', 'Мелкий песок'),
        ('d', 'Пылеватый песок'),
    )
    sand = models.CharField(
        max_length=1,
        choices=SAND,
        default='n',
        verbose_name='Описание песка',
    )

    porosity = models.FloatField(verbose_name='Коэффициент пористости')
    # gamma_streak_1 = models.FloatField(verbose_name='Расчетное значение удельного веса грунта, кН/м.куб - для крупнообломочных и песков')
    IL = models.FloatField(verbose_name='Показатель текучести - для глинистых')
    # subsidence_soil = models.BooleanField(default=False, verbose_name='Просадочный или нет - для глинистых')
        
    class Meta:
        verbose_name = 'Слой грунта'
        verbose_name_plural = 'Слои грунта'

    def __str__(self):
        return f'Слой грунта № {self.number} '

    def get_absolute_url(self):
        return reverse('layer_detail', args=[str(self.id)])
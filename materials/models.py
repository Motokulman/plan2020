from django.db import models

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
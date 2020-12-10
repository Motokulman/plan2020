from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
# from django.conf import settings


class Texture(models.Model):
    """Текстуры"""

    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Создатель текстуры') 
    texture_type = models.ForeignKey('TextureType', on_delete=models.SET_NULL, null=True, blank=True, verbose_name='Тип текстуры') 
    name = models.CharField(max_length = 200, blank=True, help_text="Название текстуры")
    json = models.TextField(blank=True, help_text="Файл JSON (тип Text) для хранения всего")
    anyfile = models.FileField(upload_to='textures/', blank=True, null=True, help_text="Произвольный файл")
    
    class Meta:
        verbose_name = 'Текстура'
        verbose_name_plural = 'Текстуры'
    
    def __str__(self):
        # return f'Текстура id {self.id} '
        return f'Текстура id {self.id}, автор: {self.author},название: {self.name}, тип: {self.texture_type.name} , json: {self.json} , anyfile: {self.anyfile} '

    def get_absolute_url(self):
        """Returns the url to access a detail record for this Texture."""
        return reverse('texture_detail', args=[str(self.id)])

    
class TextureType(models.Model):
    """Типы текстур"""

    name = models.CharField(max_length = 200, blank=True, help_text="Тип текстуры")

    class Meta:
        verbose_name = 'Тип текстуры'
        verbose_name_plural = 'Типы текстур'
    
    def __str__(self):
        return f' id {self.id}, тип текстуры: {self.name} '

    def get_absolute_url(self):
        """Returns the url to access a detail record for this TextureType."""
        return reverse('texture_type_detail', args=[str(self.id)])
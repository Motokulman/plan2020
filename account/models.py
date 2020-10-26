from django.db import models
from django.conf import settings
from geography.models import City

class Profile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to='users/%Y/%m/%d/', blank=True, null=True)
    city = models.ForeignKey(City, help_text='Выберите город. Предполагается, что пользователь это сущность, имеющая отношение к городу. Пользователь может иметь несколько точек в городе с одинаковыми ценами. Если сеть федеральная, то в каждом городе свой пользователь', on_delete=models.SET_NULL, null=True, blank=True)

   
    
    def __str__(self):
        return 'Profile for user {}'.format(self.user.username)

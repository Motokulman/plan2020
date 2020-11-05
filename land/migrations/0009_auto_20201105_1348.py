# Generated by Django 3.0.3 on 2020-11-05 10:48

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('legal', '0003_auto_20201105_1304'),
        ('land', '0008_auto_20201105_1319'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='geologicalsurvey',
            name='contractor',
        ),
        migrations.AddField(
            model_name='geologicalsurvey',
            name='contractor',
            field=models.ForeignKey(help_text='Есть резон хранить и пользователя и организацию, от имени которой он проводит исследование', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='contractor', to=settings.AUTH_USER_MODEL, verbose_name='Пользователь-исполнитель'),
        ),
        migrations.RemoveField(
            model_name='geologicalsurvey',
            name='customer',
        ),
        migrations.AddField(
            model_name='geologicalsurvey',
            name='customer',
            field=models.ForeignKey(help_text='Сделать здесь поиск пользователя по номеру телефона', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='customer', to=settings.AUTH_USER_MODEL, verbose_name='Заказчик изыскания'),
        ),
        migrations.RemoveField(
            model_name='geologicalsurvey',
            name='land',
        ),
        migrations.AddField(
            model_name='geologicalsurvey',
            name='land',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='land.Land', verbose_name='Участок'),
        ),
        migrations.RemoveField(
            model_name='geologicalsurvey',
            name='legal_entity',
        ),
        migrations.AddField(
            model_name='geologicalsurvey',
            name='legal_entity',
            field=models.ForeignKey(help_text='Есть резон хранить и пользователя и организацию, от имени которой он проводит исследование', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='legal_entity', to='legal.LegalEntity', verbose_name='Организация-исполнитель'),
        ),
    ]
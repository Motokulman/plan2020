# Generated by Django 3.0.3 on 2020-11-04 15:17

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('land', '0003_land_owner'),
    ]

    operations = [
        migrations.AlterField(
            model_name='land',
            name='owner',
            field=models.ForeignKey(help_text='Собственники участка', null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
    ]

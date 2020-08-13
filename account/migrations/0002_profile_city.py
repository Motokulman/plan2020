# Generated by Django 3.0.3 on 2020-05-26 16:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('geography', '0001_initial'),
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='city',
            field=models.ForeignKey(blank=True, help_text='Выберите город', null=True, on_delete=django.db.models.deletion.SET_NULL, to='geography.City'),
        ),
    ]
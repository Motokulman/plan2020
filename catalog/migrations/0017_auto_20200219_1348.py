# Generated by Django 3.0.2 on 2020-02-19 10:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0016_nfsize_identifier'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='masonrybonding',
            name='description',
        ),
        migrations.RemoveField(
            model_name='masonrybonding',
            name='identifier',
        ),
        migrations.AddField(
            model_name='masonrybonding',
            name='mortar',
            field=models.CharField(choices=[('cement', 'Цементный раствор'), ('clue', 'Специальный клей')], default='cement', help_text='Тип раствора', max_length=6),
        ),
        migrations.AddField(
            model_name='masonrybonding',
            name='reinforcement',
            field=models.CharField(choices=[('metal', 'Металлическая сетка'), ('plastic', 'Пластиковая сетка'), ('armature', 'Металлическая арматура'), ('no', 'Нет')], default='metal', help_text='Армирование', max_length=8),
        ),
        migrations.AddField(
            model_name='masonrybonding',
            name='reinforcing_belt',
            field=models.CharField(choices=[('yes', 'Требуется'), ('no', 'Не требуется')], default='no', help_text='Армопояс', max_length=3),
        ),
    ]

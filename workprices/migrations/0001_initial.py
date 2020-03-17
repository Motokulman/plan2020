# Generated by Django 3.0.3 on 2020-03-17 12:01

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='PileGrillageFoundationWorkPrices',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('const_expenditure', models.FloatField(verbose_name='Постоянные трудозатраты, чел.час')),
                ('transportation_procurement_cost', models.FloatField(verbose_name='Транспортно-заготовительные расходы, рублей')),
                ('reinforcement_binding', models.FloatField(verbose_name='Вязка 1м арматуры ростверка, чел.час')),
                ('clamp', models.FloatField(verbose_name='Изготовление 1 хомута, чел.час')),
                ('pile_frame', models.FloatField(verbose_name='Изготовление свайного каркаса, чел.час')),
                ('formwork', models.FloatField(verbose_name='Установка 1кв.м. опалубки (ламфанера), чел.час')),
                ('length_costs', models.FloatField(verbose_name='Затраты, зависящие от длины ростверка, за 1 пог.м., чел.час')),
                ('square_costs', models.FloatField(verbose_name='Затраты, зависящие от площали ростверка, за 1 кв.м., чел.час')),
                ('volume_costs', models.FloatField(verbose_name='Затраты, зависящие от объема бетона ростверка, за 1 куб.м., чел.час')),
                ('pile_pour', models.FloatField(verbose_name='Заливка 1 сваи, чел.час')),
                ('man_hours_cost', models.IntegerField(verbose_name='Оплата рабочим за 1 чел.час')),
                ('man_hours_profit', models.IntegerField(verbose_name='Прибыль с 1 чел.часа')),
                ('owner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Стоимость свайно-ростверкового фундамента',
                'verbose_name_plural': 'Стоимость свайно-ростверковых фундаментов',
            },
        ),
    ]

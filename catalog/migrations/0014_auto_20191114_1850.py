# Generated by Django 2.1.4 on 2019-11-14 15:50

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('catalog', '0013_auto_20191114_1513'),
    ]

    operations = [
        migrations.CreateModel(
            name='PileGrillageFoundationCost',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('const_expenditure', models.IntegerField(verbose_name='Постоянные трудозатраты, чел.час')),
                ('transportation_procurement_cost', models.IntegerField(verbose_name='Транспортно-заготовительные расходы, рублей')),
                ('reinforcement_binding', models.IntegerField(verbose_name='Вязка 1м арматуры ростверка, чел.час')),
                ('clamp', models.IntegerField(verbose_name='Изготовление 1 хомута, чел.час')),
                ('pile_frame', models.IntegerField(verbose_name='Изготовление свайного каркаса, чел.час')),
                ('formwork', models.IntegerField(verbose_name='Установка 1кв.м. опалубки (ламфанера), чел.час')),
                ('ground_leveling', models.IntegerField(verbose_name='Выравнивание 1кв.м. грунта, чел.час')),
                ('ruberoid_lining', models.IntegerField(verbose_name='Гидроизоляция рубероидом 1пог.м. опалубки, чел.час')),
                ('pile_pour', models.IntegerField(verbose_name='Заливка 1 сваи, чел.час')),
                ('grillage_pour', models.IntegerField(verbose_name='Заливка 1куб.м. бетона, чел.час')),
                ('man_hours_cost', models.IntegerField(verbose_name='Оплата рабочим за 1 чел.час')),
                ('man_hours_profit', models.IntegerField(verbose_name='Прибыль с 1 чел.часа')),
                ('owner', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Стоимость свайно-ростверкового фундамента',
                'verbose_name_plural': 'Стоимость свайно-ростверковых фундаментов',
            },
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='brick_type',
            field=models.CharField(blank=True, choices=[('f', 'Облицовочный'), ('o', 'Рядовой'), ('m', 'Рядовой c гранью под облицовку'), ('p', 'Перегородочный')], help_text='Тип кирпича - рядовой или облицовочный', max_length=1),
        ),
    ]

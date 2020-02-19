# Generated by Django 3.0.2 on 2020-02-19 08:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0013_auto_20200218_1608'),
    ]

    operations = [
        migrations.CreateModel(
            name='ClassАverageDensity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identifier', models.CharField(default='default_identifier', help_text='Уникальный неизменяемый идентификатор (только латинские символы)', max_length=200, unique=True)),
                ('name', models.CharField(help_text='Введите класс средней плотности', max_length=5)),
            ],
            options={
                'verbose_name': 'Класс средней плотности',
                'verbose_name_plural': 'Классы средней плотности',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='MarkF',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identifier', models.CharField(default='default_identifier', help_text='Уникальный неизменяемый идентификатор (только латинские символы)', max_length=200, unique=True)),
                ('name', models.CharField(help_text='Введите марку морозостойкости F', max_length=5)),
            ],
            options={
                'verbose_name': 'Марка морозостойкости F',
                'verbose_name_plural': 'Марки морозостойкости F',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='NFSize',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Введите название размера', max_length=200)),
                ('greater_bed_size', models.IntegerField(blank=True, help_text='Больший размер постели (длина), мм', null=True)),
                ('minor_bed_size', models.IntegerField(blank=True, help_text='Меньший размер постели (ширина), мм', null=True)),
                ('height', models.IntegerField(blank=True, help_text='Высота (толщина), мм', null=True)),
            ],
            options={
                'verbose_name': 'Размер НФ',
                'verbose_name_plural': 'Размеры НФ',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='RockWallMaterialSizeGrid',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identifier', models.CharField(default='default_identifier', help_text='Уникальный неизменяемый идентификатор (только латинские символы)', max_length=200, unique=True)),
                ('name', models.CharField(help_text='Введите название группы материалов с одинаковой размерной сеткой', max_length=200)),
                ('thickness_calc', models.CharField(choices=[('mm', 'Только мм'), ('both', 'И мм. и шт.')], default='mm', help_text='Толщину стены можно считать в мм. и в штуках (н.р. в кирпичах) или строго в мм. (для материалов, которые можно ложить разными сторонами)', max_length=4)),
            ],
            options={
                'verbose_name': 'Группа материалов с одинаковой размерной сеткой',
                'verbose_name_plural': 'Группы материалов с одинаковой размерной сеткой',
                'ordering': ('name',),
            },
        ),
        migrations.DeleteModel(
            name='RockWallMaterialStandardSize',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='colloquial_name',
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='work_size',
            field=models.CharField(choices=[('greater', 'Только больший размер'), ('minor', 'Только меньший размер постели'), ('both', 'Оба размера постели'), ('any', 'Любой')], default='greater', help_text='Какой размер формирует толщину стены', max_length=7),
        ),
        migrations.AlterField(
            model_name='classblight',
            name='name',
            field=models.CharField(help_text='Введите класс В', max_length=5),
        ),
        migrations.AlterField(
            model_name='markd',
            name='name',
            field=models.CharField(help_text='Введите марку D', max_length=5),
        ),
        migrations.AlterField(
            model_name='markm',
            name='name',
            field=models.CharField(help_text='Введите марку М', max_length=5),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='greater_bed_size',
            field=models.IntegerField(blank=True, help_text='Больший размер постели (длина), мм', null=True),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='height',
            field=models.IntegerField(blank=True, help_text='Высота (толщина), мм, или наименьший размер, если постель не очевидна', null=True),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='minor_bed_size',
            field=models.IntegerField(blank=True, help_text='Меньший размер постели (ширина), мм', null=True),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='producer',
            field=models.ForeignKey(blank=True, help_text='Выберите завод изготовитель', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.DirectProducer'),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='purpose',
            field=models.CharField(choices=[('wall', 'Стеновой'), ('fasade', 'Фасадный'), ('decor_edge', 'Стеновой с декоративной гранью')], default='wall', help_text='Назначение: стеновой, фасадный', max_length=10),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='class_average_density',
            field=models.ForeignKey(blank=True, help_text='Выберите стандартный класс средней плотности для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.ClassАverageDensity'),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='mark_f',
            field=models.ForeignKey(blank=True, help_text='Выберите стандартную марку морозостойкости F для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.MarkF'),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='nf_size',
            field=models.ForeignKey(blank=True, help_text='Выбрите размер НФ, которому соответствует изделие', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.NFSize'),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='size_grid',
            field=models.ForeignKey(blank=True, help_text='Группа материалов с одинаковой размерной сеткой', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.RockWallMaterialSizeGrid'),
        ),
    ]

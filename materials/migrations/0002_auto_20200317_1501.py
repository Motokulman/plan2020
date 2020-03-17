# Generated by Django 3.0.3 on 2020-03-17 12:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('brands', '0001_initial'),
        ('catalog', '0001_initial'),
        ('names', '0001_initial'),
        ('suppliers', '0001_initial'),
        ('standards', '0001_initial'),
        ('materials', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bulksand',
            name='weight',
            field=models.IntegerField(help_text='Масса песка в грузовике, тонн'),
        ),
        migrations.CreateModel(
            name='RockWallMaterialUnit',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(choices=[('brick', 'Кирпич'), ('rock', 'Камень'), ('block', 'Блок')], default='brick', help_text='Вид изделия', max_length=5)),
                ('material', models.CharField(choices=[('ceramic', 'керамический'), ('silicate', 'силикатный'), ('clinker', 'клинкерный'), ('gas_concrete', 'газобетонный'), ('ceramsite_concrete', 'керамзитобетонный')], default='ceramic', help_text='Материал изделия', max_length=18)),
                ('greater_bed_size', models.IntegerField(blank=True, help_text='Больший размер постели (длина), мм. (размер А)', null=True)),
                ('minor_bed_size', models.IntegerField(blank=True, help_text='Меньший размер постели (ширина), мм. (размер В)', null=True)),
                ('height', models.IntegerField(blank=True, help_text='Высота (толщина), мм. (размер С), или наименьший размер, если постель не очевидна', null=True)),
                ('tongue_and_groove', models.CharField(choices=[('no', 'Нет'), ('yes', 'Да')], default='no', help_text='Пазогребневая система', max_length=3)),
                ('polish', models.CharField(choices=[('no', 'Нет'), ('yes', 'Да')], default='no', help_text='Шлифованный', max_length=3)),
                ('purpose', models.CharField(choices=[('wall', 'Рядовой '), ('fasade', 'Лицевой'), ('decor_edge', 'Рядовой с декоративной гранью')], default='wall', help_text='Назначение: рядовой, лицевой', max_length=10)),
                ('partition_or_bearing', models.CharField(choices=[('partition', 'Перегородочный'), ('bearing', 'Несущий'), ('any', 'Любой')], default='bearing', help_text='Для несущих стен, для перегородок или для всего', max_length=9)),
                ('body_type', models.CharField(choices=[('solid', 'Полнотелый'), ('hollow', 'Пустотелый')], default='solid', help_text='Пустотелый или полнотелый', max_length=6)),
                ('blind_hollow', models.CharField(choices=[('no', 'Нет'), ('yes', 'Да')], default='no', help_text='Несквозные пустоты (для полнотелых кирпичей)', max_length=3)),
                ('primary_or_additional', models.CharField(choices=[('primary', 'Основной'), ('additional', 'Доборный')], default='primary', help_text='Тип элемента: основной или доборный', max_length=10)),
                ('algorithm', models.ForeignKey(blank=True, help_text='Выберите алгоритм для расчета', null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalog.Algorithm')),
                ('brand', models.ForeignKey(blank=True, help_text='Выберите главный бренд, например, Wienerberger', null=True, on_delete=django.db.models.deletion.SET_NULL, to='brands.Brand')),
                ('class_average_density', models.ForeignKey(blank=True, help_text='Выберите стандартный класс средней плотности для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='standards.ClassАverageDensity')),
                ('class_b', models.ForeignKey(blank=True, help_text='Выберите стандартный класс В для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='standards.ClassB')),
                ('face', models.ForeignKey(blank=True, help_text='Выберите название рисунка декоратьивной грани', null=True, on_delete=django.db.models.deletion.SET_NULL, to='names.DecorativeBrickFace')),
                ('manufacturer', models.ForeignKey(blank=True, help_text='Выберите завод изготовитель', null=True, on_delete=django.db.models.deletion.SET_NULL, to='suppliers.Manufacturer')),
                ('mark_d', models.ForeignKey(blank=True, help_text='Выберите стандартную марку D для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='standards.MarkD')),
                ('mark_f', models.ForeignKey(blank=True, help_text='Выберите стандартную марку морозостойкости F для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='standards.MarkF')),
                ('mark_m', models.ForeignKey(blank=True, help_text='Выберите стандартную марку М для данного материала, если есть', null=True, on_delete=django.db.models.deletion.SET_NULL, to='standards.MarkM')),
                ('sub_brand_1', models.ForeignKey(blank=True, help_text='Выберите наименование внутри бренда (Подбренд 1, если есть), например,  Porotherm', null=True, on_delete=django.db.models.deletion.SET_NULL, to='brands.SubBrand_1')),
                ('sub_brand_2', models.ForeignKey(blank=True, help_text='Выберите индекс внутри наименования (Подбренд 2, если есть), например, 44 для поротерма', null=True, on_delete=django.db.models.deletion.SET_NULL, to='brands.SubBrand_2')),
            ],
            options={
                'verbose_name': 'Единица стенового материала',
                'verbose_name_plural': 'Единицы стеновых материалов',
            },
        ),
        migrations.CreateModel(
            name='Insulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('thermal_conductivity', models.FloatField(blank=True, help_text='Введите коэффициент теплопроводности', null=True)),
                ('mat_type', models.CharField(choices=[('xps', 'XPS'), ('rock_wool', 'Минеральная вата')], default='xps', help_text='Тип утеплителя', max_length=9)),
                ('thick', models.CharField(choices=[('20', '20 мм'), ('30', '30 мм'), ('50', '50 мм'), ('100', '100 мм')], default='20', help_text='Толщина', max_length=3)),
                ('brand', models.ForeignKey(blank=True, help_text='Выберите главный бренд, например, Ursa', null=True, on_delete=django.db.models.deletion.SET_NULL, to='brands.Brand')),
            ],
            options={
                'verbose_name': 'Утеплитель',
                'verbose_name_plural': 'Утеплители',
                'ordering': ('brand',),
            },
        ),
    ]

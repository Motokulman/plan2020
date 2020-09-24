# Generated by Django 3.0.3 on 2020-09-23 15:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('materials', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='WallType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identifyer', models.CharField(blank=True, help_text='Идентификатор (имя переменной) для использования в коде (не менять впоследствии!)', max_length=200)),
                ('name', models.CharField(blank=True, help_text='Наименование', max_length=200)),
            ],
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='algorithm',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='blind_hollow',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='brand',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='class_average_density',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='class_b',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='greater_bed_size',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='height',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='mark_d',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='mark_f',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='mark_m',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='minor_bed_size',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='partition_or_bearing',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='polish',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='primary_or_additional',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='sub_brand_1',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='sub_brand_2',
        ),
        migrations.RemoveField(
            model_name='rockwallmaterialunit',
            name='tongue_and_groove',
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='decorative_face',
            field=models.CharField(choices=[('no', 'Нет'), ('yes', 'Да')], default='no', help_text='Наличие декоративной грани (для рядового кирпича)', max_length=3),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='greater_size',
            field=models.IntegerField(blank=True, help_text='Больший размер', null=True),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='middle_size',
            field=models.IntegerField(blank=True, help_text='Средний размер', null=True),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='one_story_thickness',
            field=models.IntegerField(blank=True, help_text='Толщина кладки для одноэтажного дома (материал + толщина швов)', null=True),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='small_size',
            field=models.IntegerField(blank=True, help_text='Меньший размер', null=True),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='thermal_conductivity',
            field=models.FloatField(blank=True, help_text='Теплопроводность готовой кладки (лямбда) Вт/(м*К)', null=True),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='two_story_thickness',
            field=models.IntegerField(blank=True, help_text='Толщина кладки для двухэтажного дома (материал + толщина швов)', null=True),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='body_type',
            field=models.CharField(choices=[('solid', 'Полнотелый'), ('hollow', 'Имеет незаполняемые пустоты')], default='solid', help_text='Полнотелый или имеет незаполняемые пустоты', max_length=6),
        ),
        migrations.AlterField(
            model_name='rockwallmaterialunit',
            name='purpose',
            field=models.CharField(choices=[('wall', 'Рядовой '), ('fasade', 'Лицевой')], default='wall', help_text='Назначение: рядовой, лицевой', max_length=6),
        ),
        migrations.AddField(
            model_name='rockwallmaterialunit',
            name='wall_type',
            field=models.ManyToManyField(help_text='Типы стен, куда можно применить этот материал', to='materials.WallType'),
        ),
    ]

# Generated by Django 3.0.3 on 2020-11-04 09:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('legal', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='LegalEntity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='Название', max_length=200)),
                ('INN', models.IntegerField(help_text='ИНН', unique=True)),
                ('form', models.CharField(blank=True, choices=[('e', 'ИП'), ('l', 'ООО'), ('c', 'АО')], default='l', help_text='Организационно-правовая форма', max_length=1)),
            ],
        ),
        migrations.DeleteModel(
            name='Brand',
        ),
        migrations.RemoveField(
            model_name='subbrand_2',
            name='sub_brand_1',
        ),
        migrations.DeleteModel(
            name='SubBrand_1',
        ),
        migrations.DeleteModel(
            name='SubBrand_2',
        ),
    ]

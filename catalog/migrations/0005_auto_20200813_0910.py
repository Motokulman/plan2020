# Generated by Django 3.0.3 on 2020-08-13 06:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0004_facadematerial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='facadematerial',
            name='coord',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='plan',
            name='scheme',
            field=models.TextField(blank=True, null=True),
        ),
    ]
# Generated by Django 2.1.4 on 2019-11-18 09:41

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('catalog', '0016_auto_20191118_1128'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='PileGrillageFoundationCost',
            new_name='PileGrillageFoundationWorkPrices',
        ),
    ]

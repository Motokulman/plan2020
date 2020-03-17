from django.contrib import admin

# Register your models here.
from materials.models import *
from materials.models import Insulation

admin.site.register(BulkSand)
admin.site.register(RockWallMaterialUnit)
admin.site.register(Insulation)
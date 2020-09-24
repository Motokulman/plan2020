from django.contrib import admin

# Register your models here.
from materials.models import *
from materials.models import Insulation

# admin.site.register(MaterialUse)
# admin.site.register(StoneProductLine)
# admin.site.register(StoneUnit)
admin.site.register(Insulation)
admin.site.register(WallType)
admin.site.register(RockWallMaterialUnit)
# admin.site.register(RoofCoverType)
# admin.site.register(MetalTile)
# admin.site.register(FlexibleTile)

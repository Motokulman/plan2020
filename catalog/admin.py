from django.contrib import admin

# Register your models here.
from catalog.models import Brand
from catalog.models import TradeName
from catalog.models import TradeIndex
from catalog.models import Algorithm
from catalog.models import Producer
from catalog.models import City
from catalog.models import MarkM
from catalog.models import MarkD
from catalog.models import MarkF
from catalog.models import ClassB
from catalog.models import ClassАverageDensity
from catalog.models import NFSize
from catalog.models import RockWallMaterialUnit
from catalog.models import Plan
from catalog.models import Profile
from catalog.models import RockWallMaterialPricePosition
from catalog.models import PileGrillageFoundationWorkPrices
from catalog.models import Country
from catalog.models import Region

admin.site.register(Brand)
admin.site.register(TradeName)
admin.site.register(TradeIndex)
admin.site.register(Algorithm)
admin.site.register(Producer)
admin.site.register(MarkD)
admin.site.register(MarkF)
admin.site.register(MarkM)
admin.site.register(ClassB)
admin.site.register(ClassАverageDensity)
admin.site.register(NFSize)
admin.site.register(RockWallMaterialUnit)
admin.site.register(Plan)
admin.site.register(Profile)
admin.site.register(RockWallMaterialPricePosition)
admin.site.register(PileGrillageFoundationWorkPrices)
admin.site.register(City)
admin.site.register(Country)
admin.site.register(Region)

# admin.site.register(ProviderOutlet)
# admin.site.register(City)
# admin.site.register(Customization)
# admin.site.register(MasonryBonding)
# admin.site.register(ClassАverageDensity)
# admin.site.register(RockWallMaterialUnit)
# admin.site.register(NFSize)

# @admin.register(RockWallMaterialUnit) 
# class RockWallMaterialUnitAdmin(admin.ModelAdmin):
#     list_display = ('name', 'material', 'greater_bed_size', 'minor_bed_size', 'height')

# @admin.register(RockWallMaterialStandardSize) 
# class RockWallMaterialStandardSizeAdmin(admin.ModelAdmin):
#     list_display = ('name', 'greater_bed_size')

# @admin.register(RockWallMaterialPricePosition) 
# class RockWallMaterialPricePositionAdmin(admin.ModelAdmin):
#     list_display = ('name', 'price', 'owner')

# @admin.register(PileGrillageFoundationWorkPrices) 
# class PileGrillageFoundationWorkPricesAdmin(admin.ModelAdmin):
#     list_display = ('const_expenditure', 'transportation_procurement_cost', 'owner')

# @admin.register(Profile)
# class ProfileAdmin(admin.ModelAdmin):
#     list_display = ['user', 'scheme_scale']


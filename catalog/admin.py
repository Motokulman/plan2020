from django.contrib import admin

# Register your models here.
from catalog.models import *

# admin.site.register(Brand)
# admin.site.register(SubBrand_1)
admin.site.register(FacadeMaterialType)
admin.site.register(Algorithm)
admin.site.register(Shell)

admin.site.register(Plan)


# admin.site.register(PileGrillageFoundationWorkPrices)
# admin.site.register(City)
# admin.site.register(Country)
# admin.site.register(Region)
# admin.site.register(Provider)
# admin.site.register(Activity)


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
#     list_display = ['user', 'city']


from django.contrib import admin

# Register your models here.
from catalog.models import GridUsage, Grid, PorothermSystem, BinderSolution, NFSize, ClassАverageDensity, MarkF, MasonryBonding, Profile, Customization, Plan, PileGrillageFoundationWorkPrices, ClassBLight, MarkD, MarkM, ProductBrand, Producer, ProviderActivityType, TaxSystemType, Provider, ProviderOutlet, City, RockWallMaterialUnit, RockWallMaterialPricePosition

admin.site.register(BinderSolution)
admin.site.register(ClassBLight)
admin.site.register(MarkD)
admin.site.register(MarkF)
admin.site.register(MarkM)
admin.site.register(Plan)
admin.site.register(PorothermSystem)
admin.site.register(ProductBrand)
admin.site.register(Grid)
admin.site.register(GridUsage)
admin.site.register(Producer)
admin.site.register(ProviderActivityType)
admin.site.register(TaxSystemType)
admin.site.register(Provider)
admin.site.register(ProviderOutlet)
admin.site.register(City)
admin.site.register(Customization)
admin.site.register(MasonryBonding)
admin.site.register(ClassАverageDensity)
#admin.site.register(RockWallMaterialSizeGrid)
admin.site.register(NFSize)

@admin.register(RockWallMaterialUnit) 
class RockWallMaterialUnitAdmin(admin.ModelAdmin):
    list_display = ('name', 'material', 'greater_bed_size', 'minor_bed_size', 'height')

# @admin.register(RockWallMaterialStandardSize) 
# class RockWallMaterialStandardSizeAdmin(admin.ModelAdmin):
#     list_display = ('name', 'greater_bed_size')

@admin.register(RockWallMaterialPricePosition) 
class RockWallMaterialPricePositionAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'owner')

@admin.register(PileGrillageFoundationWorkPrices) 
class PileGrillageFoundationWorkPricesAdmin(admin.ModelAdmin):
    list_display = ('const_expenditure', 'transportation_procurement_cost', 'owner')

@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'scheme_scale']


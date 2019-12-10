from django.contrib import admin

# Register your models here.
from catalog.models import Profile, Customization, Plan, PileGrillageFoundationWorkPrices, WallMaterialType, ClassBLight, MarkD, MarkM, RockWallMaterialStandardSize, Application, ProductBrand, TradeMark, TradeMarkSeries, DirectProducer, ProviderActivityType, TaxSystemType, Provider, ProviderOutlet, City, RockWallMaterialUnit, RockWallMaterialPricePosition

admin.site.register(WallMaterialType)
admin.site.register(ClassBLight)
admin.site.register(MarkD)
admin.site.register(MarkM)
admin.site.register(Plan)
admin.site.register(Application)
admin.site.register(ProductBrand)
admin.site.register(TradeMark)
admin.site.register(TradeMarkSeries)
admin.site.register(DirectProducer)
admin.site.register(ProviderActivityType)
admin.site.register(TaxSystemType)
admin.site.register(Provider)
admin.site.register(ProviderOutlet)
admin.site.register(City)
admin.site.register(Customization)
#admin.site.register(UserSettings)

@admin.register(RockWallMaterialUnit) 
class RockWallMaterialUnitAdmin(admin.ModelAdmin):
    list_display = ('body_type', 'brick_type', 'standard_size', 'primary_or_additional')


@admin.register(RockWallMaterialStandardSize) 
class RockWallMaterialStandardSizeAdmin(admin.ModelAdmin):
    list_display = ('size_type', 'name', 'identifier')

@admin.register(RockWallMaterialPricePosition) 
class RockWallMaterialPricePositionAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'owner')

@admin.register(PileGrillageFoundationWorkPrices) 
class PileGrillageFoundationWorkPricesAdmin(admin.ModelAdmin):
    list_display = ('const_expenditure', 'transportation_procurement_cost', 'owner')

@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'scheme_scale']


from django.contrib import admin

# Register your models here.
from catalog.models import WallMaterialType, ClassBLight, MarkD, MarkM, RockWallMaterialStandardSize, Application, ProductBrand, TradeMark, TradeMarkSeries, DirectProducer, ProviderActivityType, TaxSystemType, Provider, ProviderOutlet, City, RockWallMaterialUnit, RockWallMaterialPricePosition

admin.site.register(WallMaterialType)
admin.site.register(ClassBLight)
admin.site.register(MarkD)
admin.site.register(MarkM)
admin.site.register(RockWallMaterialStandardSize)
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
admin.site.register(RockWallMaterialUnit)
admin.site.register(RockWallMaterialPricePosition)




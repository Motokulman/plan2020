from django.urls import path
from . import views

urlpatterns = [
    path('my_wall_materials_prices/', views.WallMaterialPriceListView.as_view(),
         name='my-wall-materials-prices'),
]

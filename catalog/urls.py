from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('my_wall_materials_prices/', views.WallMaterialPricesByProviderListView.as_view(), name='my-wall-materials-prices'),

]
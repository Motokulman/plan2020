from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('my_prices/', views.WallMaterialPricesByProviderListView.as_view(), name='wall-materials-prices-by-provider'),

]
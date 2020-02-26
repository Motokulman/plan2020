from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('my_wall_materials_prices/', views.WallMaterialPricesListView.as_view(), name='my-wall-materials-prices'),
    path('my_work_prices/', views.works_content_list, name='my-work-prices'),
    path('my_pile_grillage_foundation_prices/<int:pk>', views.PileGrillageFoundationWorkPricesDetailView.as_view(), name='my-pile-grillage-foundation-prices'),

]

# All about plans
urlpatterns += [
    path('plans/', views.PlanListView.as_view(), name='plans'),
    path('plan/<int:pk>', views.PlanDetailView.as_view(), name='plan-detail'),
    path('plan/create/', views.PlanCreate.as_view(), name='plan_create'),
    path('plan/<int:pk>/delete/', views.PlanDelete.as_view(), name='plan_delete'),
]

# Редактирование схемы
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/', views.edit_scheme, name='edit-scheme'),

]

# Создание пользователя
urlpatterns += [   
    path('register/', views.register, name='register'),
]

# Изменение настроек пользователя
urlpatterns += [
    path('edit/', views.edit, name='edit'),
]

# Редактирование варианта
urlpatterns += [
    path('plan/<int:pk>/edit_variant/', views.edit_variant, name='edit-variant'),
]

# Попытка обновить ДОМ без перезагрузки
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/get_response', views.answer_me, name='get_response'),

]
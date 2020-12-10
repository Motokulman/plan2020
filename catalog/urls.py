from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),

]

# All about plans
urlpatterns += [
    path('plans/', views.PlanListView.as_view(), name='plans'),
    path('plan/<int:pk>', views.PlanDetailView.as_view(), name='plan-detail'),
    path('plan/create/', views.PlanCreateView.as_view(), name='plan_create'),
    path('plan/<int:pk>/delete/', views.PlanDelete.as_view(), name='plan_delete'),
]

# Редактирование схемы
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/', views.edit_scheme, name='edit-scheme'),

]

# Редактирование варианта
urlpatterns += [
    path('plan/<int:pk>/edit_variant/', views.edit_variant, name='edit-variant'),
]

# set схемы
urlpatterns += [
    path('plan/<int:plan_id>/edit_scheme/set_scheme',
         views.set_scheme, name='set_scheme'),
]

# Воспроизведение схемы
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/get_plan',
         views.get_plan, name='get_plan'),
]

# получение расчета вариантов стоимости проекта
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/get_cost',
         views.get_cost, name='get_cost'),
]


# прверка проекта
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/check_plan',
         views.check_plan, name='check_plan'),
]

# выкладка проекта
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/post_plan',
         views.post_plan, name='post_plan'),
]

# urlpatterns += [   
#     path('plan/<int:pk>/arch_skin/', views.arch_skin, name='arch-skin'),
# ]
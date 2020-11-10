from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
     path('land/create/', views.LandCreateView.as_view(), name='land_create'),
     path('land/<int:pk>', views.land_detail_view, name='land_detail'),
     path('land/<int:pk>/delete/', views.LandDelete.as_view(), name='land_delete'),
]

urlpatterns += [
     path('survey/create/', views.SurveyCreateView.as_view(), name='survey_create'),
     path('survey/<int:pk>', views.survey_detail_view, name='survey_detail'),
     path('survey/<int:pk>/delete/', views.SurveyDelete.as_view(), name='survey_delete'),
]

urlpatterns += [
     # path('well/create/', views.WellCreateView.as_view(), name='well_create'),
     path('well/<int:pk>', views.well_detail_view, name='well_detail'),
     path('well/<int:pk>/delete/', views.WellDelete.as_view(), name='well_delete'),
]

urlpatterns += [
     # path('layer/create/', views.LayerCreateView.as_view(), name='layer_create'),
     path('layer/<int:pk>', views.LayerDetailView.as_view(), name='layer_detail'),
     path('layer/<int:pk>/delete/', views.LayerDelete.as_view(), name='layer_delete'),
]


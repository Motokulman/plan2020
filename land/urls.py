from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
     path('land/create/', views.LandCreateView.as_view(), name='land_create'),
     path('land/<int:pk>', views.land_detail_view, name='land_detail'),
     path('land/<int:pk>/delete/', views.LandDelete.as_view(), name='land_delete'),
]

urlpatterns += [
     path('geologicalsurvey/create/', views.GeologicalSurveyCreateView.as_view(), name='geologicalsurvey_create'),
     path('geologicalsurvey/<int:pk>', views.GeologicalSurveyDetailView.as_view(), name='geologicalsurvey_detail'),
     path('geologicalsurvey/<int:pk>/delete/', views.GeologicalSurveyDelete.as_view(), name='geologicalsurvey_delete'),
]


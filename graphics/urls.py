from django.urls import path
from . import views

# set texture
urlpatterns = [
    path('graphics/', views.graphics, name='graphics'),
    path('texture/textures/', views.TextureListView.as_view(), name='textures'),
    path('texture_type/texture_types/', views.TextureTypeListView.as_view(), name='texture_types'),
    path('texture/<int:texture_id>/set_texture',
         views.set_texture, name='set_texture'),
]

urlpatterns += [
     path('texture/create/', views.TextureCreateView.as_view(), name='texture_create'),
     path('texture/<int:pk>', views.TextureDetailView.as_view(), name='texture_detail'),
     path('texture/<int:pk>/delete/', views.TextureDelete.as_view(), name='texture_delete'),
]

urlpatterns += [
     path('texture_type/create/', views.TextureTypeCreateView.as_view(), name='texture_type_create'),
     path('texture_type/<int:pk>', views.TextureTypeDetailView.as_view(), name='texture_type_detail'),
     path('texture_type/<int:pk>/delete/', views.TextureTypeDelete.as_view(), name='texture_type_delete'),
]
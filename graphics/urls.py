from django.urls import path
from . import views

# set texture
urlpatterns += [
    path('plan/<int:texture_id>/set_texture',
         views.set_texture, name='set_texture'),
]
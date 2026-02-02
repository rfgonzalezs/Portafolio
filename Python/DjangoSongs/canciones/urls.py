from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('agregar/', views.crear, name='crear_cancion'),
    path('editar/<int:id>', views.editar_cancion, name='editar_cancion'),
    path('eliminar/<int:id>/', views.eliminar_cancion, name='eliminar_cancion'),
]
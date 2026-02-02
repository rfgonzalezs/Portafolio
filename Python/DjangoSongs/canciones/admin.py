from django.contrib import admin
from .models import Cancion


@admin.register(Cancion)
class CancionAdmin(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'artista', 'popularidad')
    list_filter = ('artista',)
    search_fields = ('titulo', 'artista')
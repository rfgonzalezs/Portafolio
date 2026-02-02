from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Cancion(models.Model):
    titulo = models.CharField(
        max_length=150,
        verbose_name='Título'
    )

    artista = models.CharField(
        max_length=150,
        verbose_name='Artista'
    )

    popularidad = models.IntegerField(
        verbose_name='Popularidad',
        validators=[
            MinValueValidator(1),
            MaxValueValidator(10)
        ]
    )

    class Meta:
        db_table = 'cancion'  # nombre corto y limpio en MySQL
        verbose_name = 'Canción'
        verbose_name_plural = 'Canciones'

    def str(self):
        return f'{self.titulo} - {self.artista}'
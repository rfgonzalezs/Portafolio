from canciones.models import Cancion

def obtener_todas():
    """Retorna todas las canciones ordenadas por id ascendente"""
    return Cancion.objects.all().order_by('id')

def crear_cancion(datos):
    """Crea una nueva canción en la base de datos."""
    return Cancion.objects.create(**datos)

def actualizar_cancion(id, datos):
    """Actualiza los datos de una canción existente."""
    cancion = Cancion.objects.get(pk=id)
    for campo, valor in datos.items():
        setattr(cancion, campo, valor)
    cancion.save()
    return cancion

def eliminar_cancion(id):
    """Elimina una canción existente por su ID."""
    cancion = Cancion.objects.get(pk=id)
    cancion.delete()
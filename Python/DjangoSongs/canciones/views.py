from django.shortcuts import render, redirect, get_object_or_404
from canciones.services import song_service
from canciones.forms import CancionForm

def index(request):
    canciones = song_service.obtener_todas()
    context = {'canciones': canciones}
    return render(request, 'index.html', context)

def crear(request):
    if request.method == 'POST':
        form = CancionForm(request.POST)
        if form.is_valid():
            song_service.crear_cancion(form.cleaned_data)
            return redirect('index')
    else:
        form = CancionForm()
    contexto = {'form': form, 'accion':'Agregar  Cancion'}
    return render(request, 'canciones_form.html', context=contexto)

def editar_cancion(request, id):
    """Vista para editar una canción existente."""
    cancion = get_object_or_404(song_service.obtener_todas(), pk=id)
    if request.method == 'POST':
        form = CancionForm(request.POST, instance=cancion)
        if form.is_valid():
            song_service.actualizar_cancion(id, form.cleaned_data)
            return redirect('index')
    else:
        form = CancionForm(instance=cancion)
    contexto = {'form': form, 'accion': 'Editar Canción'}
    return render(request, 'canciones_form.html', contexto)

def eliminar_cancion(request, id):
    """Elimina una canción por método POST."""
    if request.method == 'POST':
        song_service.eliminar_cancion(id)
    return redirect('index')
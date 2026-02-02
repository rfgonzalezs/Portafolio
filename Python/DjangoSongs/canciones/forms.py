from django import forms
from canciones.models import Cancion

class CancionForm(forms.ModelForm):

    class Meta:
        model = Cancion
        fields = ['titulo', 'artista', 'popularidad']
        widgets = {
            'titulo': forms.TextInput(attrs={'class': 'form-control'}),
            'artista': forms.TextInput(attrs={'class': 'form-control'}),
            'popularidad': forms.NumberInput(attrs={'class': 'form-control','min':1, 'max':10}),
        }
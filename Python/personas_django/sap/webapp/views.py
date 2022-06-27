from django.http import HttpResponse
from django.shortcuts import render
from personas.models import Persona, Domicilio


# Create your views here.

def bienvenido(request):
    no_personas = Persona.objects.count()
    personas = Persona.objects.order_by('id')
    return render(request, 'bienvenido.html',{'No_Personas': no_personas, 'personas':personas},)

def domicilio(request):
    no_domicilios = Domicilio.objects.count()
    direcciones = Domicilio.objects.order_by('id')
    return render(request, 'domicilio.html', {'No_domicilios': no_domicilios, 'domicilios': direcciones},)
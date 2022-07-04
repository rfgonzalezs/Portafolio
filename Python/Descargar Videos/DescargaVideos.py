#instalar e importar libreria
import pytube

#Ingresar URL del video
url = input("Ingrese el URL del video: ")

#Direccion en donde se va a guardar el video
path = "C:/Users/Raf/Downloads"

pytube.YouTube(url).streams.get_highest_resolution().download(path)

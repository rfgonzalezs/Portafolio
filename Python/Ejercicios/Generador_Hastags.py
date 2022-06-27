def generador_hastags(cadena: str):
    if not cadena or len(cadena) > 140:
        return False
    else:
        lista_palabras = cadena.split()
        return_cadena = ""
        for palabra in lista_palabras:
            return_cadena += palabra.capitalize()
        return "#"+ return_cadena

if __name__ == '__main__':
   print(generador_hastags('Curso Python!'))
   print(generador_hastags('curso python!        '))
   print(generador_hastags(''))
   print(generador_hastags('Python!'*140))
   print(generador_hastags('a l v p'))
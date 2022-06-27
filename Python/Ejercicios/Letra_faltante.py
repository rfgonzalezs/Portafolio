def letra_faltante(lista_letras):
    indice = 0
    while ord(lista_letras[indice]) + 1 == ord(lista_letras[indice+1]):
        indice += 1 
    return chr(ord(lista_letras[indice] )+1)
# lista_letras = ['O','Q','R','S']
# lista_letras = ['a','b','c','d','f']
lista_letras = ['a','l','o','p','z']
print(letra_faltante(lista_letras))

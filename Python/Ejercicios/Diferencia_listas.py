def diferencia_listas(lista_origen, lista_resta):
    for elementos_b in lista_resta:
        while elementos_b in lista_origen:
            lista_origen.remove(elementos_b)    
    return lista_origen

def Dif_list(lista_origen, lista_resta):
    lista_return =[]
    for elementos in lista_origen:
        if elementos not in lista_resta:
            lista_return.append(elementos)
    return lista_return

def Dif_lista(lista_origen, lista_resta):
    return [x for x in lista_origen if x not in lista_resta]

a = [1,2,2,2,2,2,3,4,5,4,4,5,4,5,5,5]
b = [2,5,4]

print(diferencia_listas(a,b))
print(Dif_list(a,b))
print(Dif_lista(a,b))
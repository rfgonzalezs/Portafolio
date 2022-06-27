def PromedioMayores(lista: list):
    lista.sort()
    ultimos_tres = lista[-3:]
    print(sum(ultimos_tres)/len(ultimos_tres))
    return

mi_lista = [1,9,81,5,15,0,77,45,3,2,55]
PromedioMayores(mi_lista)
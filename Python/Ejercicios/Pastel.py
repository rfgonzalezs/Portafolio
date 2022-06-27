def pasteles(receta, disponible):
    lista_ingredientes = []
    for elemento in receta:
        if elemento not in disponible.keys():
            return 0
        else:
            lista_ingredientes.append(disponible[elemento] // receta[elemento])        
    return min(lista_ingredientes)

if __name__ == '__main__':
   receta = {'harina':500, 'azucar':200, 'huevos':1, 'manzana':1}
   disponible = {'harina':1200, 'azucar':1200, 'huevos':5, 'leche':200,'manzana':5}
   print(pasteles(receta,disponible))
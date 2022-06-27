def incrementar_cadena(cadena: str):
    cadena_separada = ["" , ""]
    for elemento in cadena:
        if elemento.isdigit():
            cadena_separada[1] += elemento
        else:
            cadena_separada[0] += elemento 
    if not cadena_separada[1]:
        cadena_separada[1] = "1"
    else:
        cadena_separada[1] = str(int(cadena_separada[1])+1).zfill(len(cadena_separada[1])) 
    print(cadena_separada)
    return 

print(incrementar_cadena('hola5'))
print(incrementar_cadena('python'))
print(incrementar_cadena('hola000'))
print(incrementar_cadena('hola010'))  
print(incrementar_cadena('Python55'))
print(incrementar_cadena('ALVP99'))
def tarjeta_credito(numero_tarjeta):
    valor_escondido = ""
    for index in range(0,len(numero_tarjeta)-4):
        valor_escondido += "*"
    valor_escondido += numero_tarjeta[-4:]
    return valor_escondido

def TdC(numero_tarjeta):
    return "*" *(len(numero_tarjeta)-4)+numero_tarjeta[-4:]

print(tarjeta_credito("1234567890"))
print(TdC("0987654321"))
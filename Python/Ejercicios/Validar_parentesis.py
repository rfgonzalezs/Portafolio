def validar_parentesis(cadena):
    cont_parentesis = 0
    for elemento in cadena:
        if elemento == "(":
            cont_parentesis += 1
        elif elemento == ")":
            cont_parentesis -= 1
        elif cont_parentesis <  0:
            return False
    return not cont_parentesis
    # if cont_parentesis == 0:
    #     return True            
    # return False

print(validar_parentesis("(c(b(a)))(d)"))
print(validar_parentesis("()"))
print(validar_parentesis(")(()))"))
print(validar_parentesis("(())(()()())"))
def alphanumeric(contrasena: str) -> bool:
    for caracter in contrasena:
        caracter = ord(contrasena)
        if not(32 <= caracter <= 126):
            return False
    return True

print(alphanumeric("hello world"))
print(alphanumeric("PassW0rd"))
print(alphanumeric("     "))
print(alphanumeric("__ * __"))
print(alphanumeric("&)))((("))
print(alphanumeric("43534h56jnTHHF3k"))
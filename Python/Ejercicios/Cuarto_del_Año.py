def cuarto(mes: int) -> int:
    if mes >= 1 and mes <= 3:
        return 1
    elif mes >= 4 and mes <= 6:
        return 2
    elif mes >= 7 and mes <= 9:
        return 3
    elif mes >= 10 and mes <= 12:
        return 4
    return

print(cuarto(1))
print(cuarto(3))
print(cuarto(6))
print(cuarto(8))
print(cuarto(11))
print(cuarto(12))

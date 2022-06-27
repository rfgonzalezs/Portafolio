from mundo_pc.computadora import Computadora
from mundo_pc.monitor import Monitor
from mundo_pc.orden import Orden
from mundo_pc.raton import Raton
from mundo_pc.teclado import Teclado

teclado1 = Teclado('Genius', 'USB')
raton1 = Raton('J&R', 'USB')
monitor1 = Monitor('LG', 17)
computadora1 = Computadora('CLON', monitor1, teclado1, raton1)
# print(computadora1)

teclado2 = Teclado('Acer', 'Bluetooth')
raton2 = Raton('Acer', 'Bluetooth')
monitor2 = Monitor('Acer', '25')
computadora2 = Computadora('Acer', monitor2, teclado2, raton2)
# print(computadora2)

computadoras1 = [computadora1, computadora2]
orden1 = Orden(computadoras1)
print(orden1)
library(magic)
magic(4)

#install.packages()

#Combinatoria
factorial(10)
choose(5,3)
choose(10,4)

#Funciones
cuadrado = function(x) {x^2}
x = 26
cuadrado(x)

#remover historial de variables
#ls() ver elementos de la lista
#rm() eliminar elementos de la lista
rm(list = ls())

#numeros complejos
(3+2i)*5
complex(real = pi ,imaginary = sqrt(2)) -> z1
z1
v <- sqrt(as.complex(2))

#vectores
numeros = c(1,2,3,4,5)
puto = rep("Puto",5)
#fix(numeros)
class(numeros)
class(puto)
year = rep(1987,10)
vec <- c(16,0,1,20,1,7.88,5,1,9)
seq(10,100, by = 5)
seq(100,10,by = -5)
seq(5,35, length.out = 7)
seq(5,length.out=100, by = 3)
x = 1:10
-5:5
1:20
seq(2,20, by = 2)
sapply(x, FUN = function(elemento){sqrt(elemento)})
coefd = function(x){summary(lm((1:4)~c(1:3,x)))$r.squared}
#coefd(5)
sapply(x, FUN =  coefd)
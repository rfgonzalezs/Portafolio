#instalar paaquetes de R
browseURL("http://cran.r-project.org/web/views/")
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name/")
browseURL("http://crantastic.org")

install.packages("LiblineaR")
#mirar paquetes
library()
search()

#Llamar el paquete en el sript
require(LiblineaR)
#Desligar el paquete del sript
detach("package:LiblineaR",unload=TRUE)

#ayuda de un paquete
??ggplot2
data()
library(help="datasets")
? iris

str(iris)
iris
data=("iris")

#Ingresar datos
x0 <- 1:10
x1 <- c(2,5,7,4)
x2 <- seq(1,50, by=0.1)
#Ingresar manualmente datos
x3 <- scan()
#Cargar datos de un archivo
Product <- read.table("C:/Users/Raf/Documents/R/Product.txt", header=TRUE, sep="\t")
str(Product)
Customer <- read.csv("C:/Users/Raf/Documents/R/Customer.csv", header=TRUE)
Customer
View(Customer)

#Graficar datos
y <- table(Customer$Region)
y
View(y)
barplot(y)
barplot(y[order(y)])
barplot(y[order(-y)])
barplot(y[order(y)],horiz=TRUE, col="red")
barplot(y[order(y)],horiz=TRUE, col=c("red","green","blue","black"))
colors()
barplot(y[order(y)],horiz=TRUE, col=c("red","green","blue","black"),border=NA, main="Freq of Regions" )
barplot(y[order(y)],horiz=TRUE, col=c("red","green","blue","black"),border=NA, main="Freq of Regions", xlab="Number of Customers", ylab="Regions")

#Guardar una grafica manualmente
png(filename="C:/Users/Raf/Documents/R/Freq.png", width=888, height=575)
barplot(y[order(y)],horiz=TRUE, col=c("red","green","blue","black"),border=NA, main="Freq of Regions", xlab="Number of Customers", ylab="Regions")
dev.off()

hist(Customer$Age)
hist(Customer$Age, breaks = 5)
hist(Customer$Age, breaks = c(0,40,60,100), freq = TRUE)

hist(Customer$Age, breaks = c(0,40,60,100), freq = TRUE, col = "blue", main = "Histograma de Edad")

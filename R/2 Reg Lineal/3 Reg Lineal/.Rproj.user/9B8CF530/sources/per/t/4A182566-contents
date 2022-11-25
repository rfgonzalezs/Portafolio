#Cargar los datos

df <- read.csv("C:/Users/Raf/Documents/R/3 Ejercicio 2/House_Price.csv", header = TRUE)
str(df)

#Analisis univariado EDD
summary(df)
boxplot(df$n_hot_rooms)
pairs(~df$sold+df$rainfall)

barplot(table(df$airport))
barplot(table(df$bus_ter))

# Observaciones
# 1)rainfall y n_hot_rooms tienen valores atipicos
# 2)n_hot_beds faltan valores
# 3)bus_ter es una variables inservible

quantile(df$n_hot_rooms,0.99)
uv <- 3*quantile(df$n_hot_rooms,0.99)
df$n_hot_rooms[df$n_hot_rooms>uv] <- uv
summary(df$n_hot_rooms)

lv <- 0.3*quantile(df$rainfall,0.01)
df$rainfall[df$rainfall<lv] <- lv
summary(df$rainfall)

mean(df$n_hos_beds)
mean(df$n_hos_beds,na.rm = TRUE)
which(is.na(df$n_hos_beds))
df$n_hos_beds[is.na(df$n_hos_beds)]  <- mean(df$n_hos_beds,na.rm = TRUE)
summary(df$n_hos_beds)

# Tranformacion de variables
df$avr_dist <- (df$dist1+df$dist2+df$dist3+df$dist4)/4
# df2 <- df[,-6:-9]
df2 <- df[,-7:-10]
df = df2
rm(df2)
# df <- df[,-13]
df <- df[,-14]

#  Creacion variables Dummies
library(dummies)
df <- dummy.data.frame(df)
df <- df[,-9]
df <- df[,-14]

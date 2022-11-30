#Importando datos
df <- read.csv(
  'C:/Users/Raf/Documents/R/Algoritmos hechos por mi/Preprocesamiento de Datos/Archivos csv/House_Price.csv', header=TRUE)
str(df)

#EDD(Diccionario de Datos Extendidos)
summary(df)
hist(df$crime_rate)
pairs(~price+crime_rate+n_hot_rooms+rainfall, data=df)  
barplot(table(df$airport))  
barplot(table(df$waterbody))    
barplot(table(df$bus_ter))  

# Observaciones en el Dataframe
#1. Valores atipicos en n_hot_rooms y rainfall
#2. Valores faltantes en n_hos_beds
#3. bus_ter es una variable inservible
#4. crime_rate tiene algunas relaciones funcionales con price

#Tratamiento de valores atipicos
quantile(df$n_hot_rooms, 0.99)
uv = 3*quantile(df$n_hot_rooms, 0.99)
df$n_hot_rooms[df$n_hot_rooms > uv] <- uv
summary(df$n_hot_rooms)

lv =0.3*quantile(df$rainfall, 0.01)
df$rainfall[df$rainfall < lv] = lv
summary(df$rainfall)

#Valores faltantes
mean(df$n_hos_beds)
mean(df$n_hos_beds, na.rm=TRUE)
which(is.na(df$n_hos_beds))
df$n_hos_beds[is.na(df$n_hos_beds)] <- mean(df$n_hos_beds, na.rm=TRUE)

summary(df$n_hos_beds)
which(is.na(df$n_hos_beds))

#Transformacion y eliminacion de variables
pairs(~price+crime_rate, data=df )
plot(df$price,df$crime_rate)

df$crime_rate=log(1+df$crime_rate)
plot(df$price,df$crime_rate)

df$avg_dist <- (df$dist1+df$dist2+df$dist3+df$dist4)/4
df2 <- df[,-7:-10]
df <- df2
rm(df2)
df <- df[,-14]

#Creacion de variables Dummies
library(dummies)
df <- dummy.data.frame(df)
df <- df[,-9]
df <- df[,-14]

#Matriz de Correlacion
round(cor(df),2)
df <- df[,-16]

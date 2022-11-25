library(dummies)

# Regresion de modelo Logisto
df <- read.csv("C:/Users/Raf/Documents/R/4 Reg Logistica/House-Price.csv", header = TRUE)

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
df2 <- df[,-6:-9]
df = df2
rm(df2)
df <- df[,-13]

#  Creacion variables Dummies
df <- dummy.data.frame(df)
df <- df[,-8]
df <- df[,-13]

# Reg Simple
glm.fit = glm(Sold~price, data=df, family=binomial)
summary(glm.fit)

# Reg Multiple
glm.fit = glm(Sold~., data=df, family=binomial)
summary(glm.fit)

#  Prediciendo la probabilidad
glm.probs = predict(glm.fit, type = "response")
glm.probs[1:10]

glm.pred = rep("NO",506)
glm.pred[glm.probs>0.5] = "YES"

table(glm.pred,df$Sold)

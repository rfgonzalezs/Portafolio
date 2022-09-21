#Programa de Analisis de precios de casas
#Desarrollado por rfgonzalezs@gmail.com

df <- read.csv("C:/Users/Raf/Documents/R/2 Ejercicio 1/House_Price.csv", header = TRUE)
#str(df)

#EDD (Extended Data Dictionary)
summary(df)
hist(df$crime_rate)
pairs(~price+crime_rate+n_hot_rooms+rainfall, data = df)
barplot(table(df$airport))
barplot(table(df$waterbody))
barplot(table(df$bus_ter))

#Observaciones
#n_hot_rooms y rainfall tienen valores atipicos
#h_hot_beds faltan valores
#bus_ter es una variable que no sirve
#crime_rate tiene alguna otra relaci?n funcional con el precio

#tratamiento de valores at?picos
uv = 3*quantile(df$n_hot_rooms, 0.99)
df$n_hot_rooms[df$n_hot_rooms > uv] <- uv
summary(df$n_hot_rooms)

lv = 0.3*quantile(df$rainfall, 0.01)
df$rainfall[df$rainfall > lv] <- lv
summary(df$rainfall)

mean(df$n_hos_beds)
mean(df$n_hos_beds, na.rm = TRUE)
which(is.na(df$n_hos_beds))
df$n_hos_beds[is.na(df$n_hos_beds)] <- mean(df$n_hos_beds, na.rm = TRUE)
summary(df$n_hos_beds)
which(is.na(df$n_hos_beds))

#Transformacion de Variables
pairs(~price+crime_rate, data = df)
plot(df$price, df$crime_rate)

df$crime_rate=log(1+df$crime_rate)

df$avg_dist = (df$dist1+df$dist2+df$dist3+df$dist4)/4
df2 <- df[,-7:-10]
df <- df2
rm(df2)
df<- df[,-14]

#Variables Dummies
install.packages("dummies")
library(dummies)
require(dummies)
df <- dummy.data.frame(df)
df <- df[,-9]
df <- df[,-14]

#Metricas de Correlacion
cor(df)
round(cor(df),2)
df <- df[,-16]

#Regresion Lineal
simple_model <- lm(price~room_num,data=df)
summary(simple_model)
plot(df$room_num,df$price)
abline(simple_model, col="red")

#multiple Reg lineal
multiple_model <- lm(price~.,data =df)
summary(multiple_model)

#Entrenamiento del modelo para hallar el error
install.packages("caTools")
library(caTools)
set.seed(0)
split = sample.split(df,SplitRatio = 0.8)
training_set =  subset(df,split == TRUE)
test_set = subset(df, split == FALSE)

lm_a = lm(price~.,data = training_set)
train_a = predict(lm_a, training_set)
test_a = predict(lm_a, test_set)
mean((training_set$price-train_a)^2)
mean((test_set$price-test_a)^2)

install.packages("leaps")
library(leaps)

lm_best = regsubsets(price~.,data = df, nvmax = 15)
summary(lm_best)
summary(lm_best)$adjr2
which.max(summary(lm_best)$adjr2)

coef(lm_best, 8)
lm_forward = regsubsets(price~.,data = df, nvmax = 15, method = "forward")
summary(lm_forward)

#metodos Ridge y Lasso
install.packages("glmnet")
library(glmnet)

x = model.matrix(price~., data = df)[,-1]
y = df$price
grid = 10^seq(10,-2, length = 100)
grid

lm_ridge = glmnet(x,y,alpha = 0, lambda = grid)
summary(lm_ridge)
cv_fit_R =cv.glmnet(x,y,alpha = 0, lambda = grid)
plot(cv_fit_R)
opt_lambda_R = cv_fit_R$lambda.min
tss_R = sum((y-mean(y))^2)
y_a_R = predict(lm_ridge, s = opt_lambda_R, newx = x)
rss_R = sum((y_a_R-y)^2)
rsq_R = 1- rss_R/tss_R

lm_lasso = glmnet(x,y,alpha = 1, lambda = grid)
summary(lm_lasso)
cv_fit_L =cv.glmnet(x,y,alpha = 0, lambda = grid)
plot(cv_fit_L)
opt_lambda_L = cv_fit_L$lambda.min
tss_L = sum((y-mean(y))^2)
y_a_L = predict(lm_lasso, s = opt_lambda_L, newx = x)
rss_L = sum((y_a_L-y)^2)
rsq_L = 1- rss_L/tss_L

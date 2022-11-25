#  Importando Librerias
library(caTools)
library(e1071)

# Importando Datos
df <- read.csv('C:/Users/Raf/Documents/R/Algoritmos hechos por mi/5. Support Vector Machine SVM/Archivos csv/Movie_regression.csv')
summary(df)

# Preprocesamiento de datos
df$Time_taken[is.na(df$Time_taken)] <- mean(df$Time_taken, na.rm = TRUE)
summary(df)

# Test-Train Split
set.seed(0)
split = sample.split(df,SplitRatio = 0.8)
train = subset(df, split == TRUE)
test  = subset(df, split == FALSE)

# Regresion Lineal
svmRfitL = svm(Collection~., data = train, kernel = "linear", cost = 0.01, scale = TRUE)
summary(svmRfitL)

ypredRL = predict(svmRfitL,test)
mseL <- mean((ypredRL - test$Collection)^2)

# Regresion Polimonial
svmRfitP = svm(Collection~., data = train, kernel = "polynomial", cost=1, degree=2, scale=TRUE)
ypredRP = predict(svmRfitP,test)
mseP <- mean((ypredRP - test$Collection)^2)

# Regresion Radial
svmRfitR = svm(Collection~., data = train, kernel = "radial", cost=0.01, gamma=1, scale=TRUE)
ypredRR = predict(svmRfitR,test)
mseR <- mean((ypredRR - test$Collection)^2)

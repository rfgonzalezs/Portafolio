#  Importando Librerias
library(caTools)
library(rpart)
library(rpart.plot)

# Importando Datos
df <- read.csv('C:/Users/Raf/Documents/R/Algoritmos hechos por mi/4. Simple Decision Tree SDT/Archivos csv/Movie_classification.csv')
summary(df)

# Preprocesamiento de datos
df$Time_taken[is.na(df$Time_taken)] <- mean(df$Time_taken, na.rm = TRUE)
summary(df)

# Test-Train Split
set.seed(0)
split = sample.split(df,SplitRatio = 0.8)
trainc = subset(df, split == TRUE)
testc  = subset(df, split == FALSE)

# Corriendo la Regresion de Arbol on train set
classtree = rpart(formula = Start_Tech_Oscar~., data = trainc, method = 'class', control = rpart.control(maxdepth=3))

# Graficando el Arbol de Desicion
rpart.plot(classtree, box.palette = 'RdBu', digits = -3)

# Prediciendo un valor en cualquier posicion
testc$pred <- predict(classtree, testc, type = 'class')
table(testc$Start_Tech_Oscar,testc$pred)
63/112

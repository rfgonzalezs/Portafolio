#  Importando Librerias
library(caTools)
library(rpart)
library(rpart.plot)

# Importando Datos
movie <- read.csv('C:/Users/Raf/Documents/R/Algoritmos hechos por mi/4. Simple Decision Tree SDT/Archivos csv/Movie_Regression.csv')
summary(movie)

# Preprocesamiento de datos
movie$Time_taken[is.na(movie$Time_taken)] <- mean(movie$Time_taken, na.rm = TRUE)
summary(movie)

# Train-Test-Split
set.seed(0)
split = sample.split(movie,SplitRatio = 0.8)
train = subset(movie, split == TRUE)
test  = subset(movie, split == FALSE)

# Corriendo la Regresion de Arbol on train set
regtree = rpart(formula = Collection~., data = train, control = rpart.control(maxdepth=3))

# Graficando el Arbol de Desicion
rpart.plot(regtree, box.palette = 'RdBu', digits = -3)

# Prediciendo un valor en cualquier posicion
test$pred <- predict(regtree, test, type = 'vector')
MSE2 <- mean((test$pred - test$Collection)^2)

# Podando el Arbol
fulltree <- rpart(formula=Collection~., data=train, control=rpart.control(cp=0))
rpart.plot(fulltree, box.palette = 'RdBu', digits =  -3)
printcp(fulltree)
plotcp(regtree)

mincp <- regtree$cptable[which.min(regtree$cptable[,'xerror']),'CP']
prunetree <- prune(regtree, cp = mincp)
rpart.plot(prunetree, box.palette = 'RdBu',digits = -3)

test$fulltree <- predict(fulltree,test, type = 'vector')
MSE2full <- mean((test$fulltree - test$Collection)^2)

test$pruned <- predict(prunetree, test, type='vector')
MSE2pruned  <- mean((test$pruned - test$Collection)^2) 

# accuracy_postrun <- mean(test$pred == test$left)
# data.frame(base_accuracy, accuracy_prerun, accuracy_postrun)

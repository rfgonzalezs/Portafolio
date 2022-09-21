#  Importando Datos
movie <- read.csv("C:/Users/Raf/Documents/R/7 Arbol de decision simple/Movie_regression.csv", header = TRUE)

# Pre-prosesamiento de datos
summary(movie)
movie$Time_taken[is.na(movie$Time_taken)] <- mean(movie$Time_taken,na.rm = TRUE)
summary(movie$Time_taken)

# Test-Train split
library(caTools)
set.seed(0)
split = sample.split(movie, SplitRatio =  0.8)
#  Creacion variables Dummies
library(dummies)
movie <- dummy.data.frame(movie)
train = subset(movie, split == TRUE)
test = subset(movie, split == FALSE)

#  Paquetes requeridos
# install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

# Correr a regresion de modelo de arbol en train set
regtree <- rpart(formula = Collection~., data = train, control = rpart.control(maxdepth = 3))

# Grafica del Arbol  de desicion
rpart.plot(regtree,box.palette = "RdBu",digits = 3)

# Prediccion de valores en cualquier punto
test$pred <- predict(regtree, test, type = "vector")

MSE2 <- mean((test$pred - test$Collection)^2)

# Podado del Arbol
fulltree <- rpart(formula = Collection~., data = train, control = rpart.control(cp=0))
rpart.plot(fulltree,box.palette = "RdBu", digits = 3)
printcp(fulltree)
plotcp(regtree)

mincp <- regtree$cptable[which.min(regtree$cptable[,"xerror"]),"CP"]

prunedtree <- prune(regtree, cp = mincp)
rpart.plot(prunedtree, box.palette = "RdBu", digits = 3)

test$fulltree <- predict(fulltree, test, type = "vector")
MSE2 <- mean((test$fulltree - test$Collection)^2)

test$pruned <- predict(prunedtree, test, type = "vector")
MSE2pruned <- mean((test$pruned - test$Collection)^2)

accuracy_postprun <- mean(test$pred == test$left)
data.frame(base_accuracy, accuracy_preprun, accuracy_postprun)

# Arbol de Clasificacion
library(datasets)
df  <- read.csv("C:/Users/Raf/Documents/R/7 Arbol de decision simple/Movie_classification.csv", header = TRUE)
View(df)

# Pre-procesamiento de Datos
summary(df)
df$Time_taken[is.na(df$Time_taken)] <- mean(df$Time_taken, na.rm = TRUE)

# Test-Train Split
library(caTools)
set.seed(0)
split = sample.split(movie,SplitRatio = 0.8)
trainc = subset(df, split == TRUE)
testc = subset(df,split == FALSE)

# Correr el Modelo de Arbol de Clasificacion en train set
library(rpart)
library(rpart.plot)
classtree <- rpart(formula = Start_Tech_Oscar~., data = trainc, method = 'class', control = rpart.control(maxdepth = 3))

# Grafica del Arbol de Decision
rpart.plot(classtree, box.palette = "RdBu", digits = 3)

# Prediccion de valore en cualquier punto
testc$pred <- predict(classtree, testc, type = "class")
table(testc$Start_Tech_Oscar,testc$pred)
73/112

# Tecnicas de Conjunto

# Bagging
# install.packages("randomForest")
library(randomForest)
set.seed(0)
bagging = randomForest(formula = Collection~., data = train, mtry=17)
test$bagging <- predict(bagging, test)
MSE2bagging <- mean((test$bagging - test$Collection)^2)


# Random Forest
# library(randomForest)
randomfor <- randomForest(Collection~., data = train, ntree=500)
# salida de prediccion
test$random <- predict(randomfor,test)
MSE2random <- mean((test$random - test$Collection)^2)


# Gradient Boosting Model GBM
# install.packages("gbm")
library(gbm)
set.seed(0)
boosting = gbm(Collection~., data = train, distribution = "gaussian", n.trees = 5000, interaction.depth = 4, shrinkage = 0.2, verbose = F)
# distribution = 'Gaussian' for regression and 'Bernoulli' for classification
test$boost = predict(boosting, test, n.trees = 5000)
MSE2boost <- mean((test$boost - test$Collection)^2)

# Adaboost
# install.packages("adabag")
library(adabag)
trainc$Start_Tech_Oscar <- as.factor(trainc$Start_Tech_Oscar)
adaboost <- boosting(Start_Tech_Oscar~., data = trainc, boos = TRUE,mfinal=1000)
predada <- predict(adaboost, testc)
table(predada$class,testc$Start_Tech_Oscar)
82/113
t1 <- adaboost$trees[[1]]
plot(t1)
text(t1, pretty=100)

# XGboost
install.packages("xgboost")
library(xgboost)
trainY = trainc$Start_Tech_Oscar == "1"
trainX = model.matrix(Start_Tech_Oscar ~ . -1, data = trainc)
trainX <- trainX[,-12]
testY = testc$Start_Tech_Oscar == "1"
testX = model.matrix(Start_Tech_Oscar ~ . -1, data = testc)
testX <- testX[,-12]
# borrar variables adicionales
testX <- testX[,-21:-23]
Xmatrix <- xgb.DMatrix(data = trainX, label= trainY)
Xmatrix_t <- xgb.DMatrix(data = testX, label= testY)

Xgboosting <- xgboost(data = Xmatrix, #los datos
                      nround = 50, #numero max. de iteraciones boosting
                      objetive = "multi:softmax",eta=0.3, num_class = 2, max_depth = 10)
xgpred <- predict(Xgboosting, Xmatrix_t)
table(testY, xgpred)


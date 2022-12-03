# Importan Librerias
library(dummies)
library(gbm)
library(adabag)
library(xgboost)

# Preprosesamiento de datos
train2 <- dummy.data.frame(data = train)
train2 <- train2[,-12]
train2 <- train2[,-15]
test2 <- dummy.data.frame(data = test)
test2 <- test2[,-12]
test2 <- test2[,-15]

# Gradient Boosting 
set.seed(0)
boosting = gbm(Collection~., data = train2, distribution = "gaussian", n.trees = 5000, interaction.depth = 4, shrinkage = 0.2, verbose = F)
test$boost = predict(boosting, test2, n.trees=5000)
MSE2boost <- mean((test$boost - test2$Collection)^2)

#  Ada Boost
trainc$Start_Tech_Oscar1 <- as.factor(trainc$Start_Tech_Oscar)
adaboost <- boosting(Start_Tech_Oscar1~.-Start_Tech_Oscar, data=trainc, boos=TRUE, nfinal=1000)
predada  <- predict(adaboost, testc)
table(predada$class,testc$Start_Tech_Oscar)

t1 <- adaboost$tree[[1]]
plot(t1)
text(t1,pretty=100)

# XGBoosting
trainY <- trainc$Start_Tech_Oscar == "1"
trainX <- model.matrix(Start_Tech_Oscar ~ .-1, data = trainc)
trainX <- trainX[,-12]
trainX <- trainX[,-21]

testY  <- testc$Start_Tech_Oscar == "1"
testX  <- model.matrix(Start_Tech_Oscar ~ .-1, data = testc)
testX  <- testX[,-12]
testX  <- testX[,-21]

Xmatrix   <- xgb.DMatrix(data = trainX, label = trainY)
Xmatrix_t <- xgb.DMatrix(data = testX, label = testY)

Xgboosting <- xgboost(data  = Xmatrix,
                      nround = 50,                      
                      objective = "multi:softmax",
                      nthread = 2,
                      eta = 0.3, 
                      num_class= 2,
                      max_depth = 100)
xgpred <- predict(Xgboosting, Xmatrix_t)
print(xgpred)
table(testY, xgpred)

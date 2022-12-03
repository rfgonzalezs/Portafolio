# Importando librerias
library(randomForest)

set.seed(0)
bagging = randomForest(Collection~., data = train, mtry = 17)
test$bagging <- predict(bagging, test)
MSE2bagging  <- mean((test$bagging - test$Collection)^2)

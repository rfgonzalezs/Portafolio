# Importando librerias
library(class) # K-Nearest Neighbors

# K-Nearest Neighbors
trainX = train_set[,-15]
testX  = test_set[,-15]
trainy = train_set$Sold
testy  = test_set$Sold
k = 1
trainX_s = scale(trainX)
testX_s  = scale(testX)
set.seed(0)
knn.pred = knn(trainX_s, testX_s, trainy, k = k)
table(knn.pred, testy)

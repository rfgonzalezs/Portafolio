# Importando librerias
library(MASS) # LDA

#  Analisis Discriminante Lineal
lda.fit = lda(Sold~., data = df)
lda.fit
lda.pred = predict(lda.fit, df)
lda.pred$posterior
lda.class = lda.pred$class
table(lda.class, df$Sold)
sum(lda.pred$posterior[,1] > 0.8)

# Anlisis Discriminante Cuadratico
qda.fit = qda(Sold~., data = df)
qda.fit
qda.pred = predict(qda.fit, df)
qda.pred$posterior
qda.class = qda.pred$class
table(qda.class, df$Sold)
sum(qda.pred$posterior[,1] > 0.8)


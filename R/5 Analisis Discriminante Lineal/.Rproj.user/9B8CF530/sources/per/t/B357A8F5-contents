# Analisis Discriminante Lineal
df <- read.csv("C:/Users/Raf/Documents/R/5 Analisis Discriminante Lineal/House-Price.csv", header = TRUE)

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
library(dummies)
df <- dummy.data.frame(df)
df <- df[,-8]
df <- df[,-13]

# Reg Simple
glm.fit = glm(Sold~price, data=df, family=binomial)
summary(glm.fit)

# Reg Multiple
glm.fit = glm(Sold~., data=df, family=binomial)
summary(glm.fit)

# Analisis Lineal Discriminante
# install.packages("MASS")
library(MASS)
lda.fit = lda(Sold~., data = df)
lda.fit
lda.pred = predict(lda.fit, df)
lda.pred$posterior

lda.class =lda.pred$class
table(lda.class,df$Sold)

sum(lda.pred$posterior[,1]>0.8)

# Analisis Cuadratico Discriminante
qda.fit = qda(Sold~., data = df)
qda.fit
qda.pred = predict(qda.fit, df)
qda.pred$posterior

qda.class =qda.pred$class
table(qda.class,df$Sold)

sum(qda.pred$posterior[,1]>0.8)

# Test-Train 
library(caTools)
set.seed(0)
split = sample.split(df,SplitRatio = 0.8)
train_set = subset(df,split == 'TRUE')
test_set =subset(df,split == 'FALSE')

train.fit = glm(Sold~.,data = train_set, family = binomial())
test.probs = predict(train.fit,test_set,type = 'response')

test.pred = rep('NO',120)
test.pred[test.probs>0.5] = 'YES'
table(test.pred,test_set$Sold)

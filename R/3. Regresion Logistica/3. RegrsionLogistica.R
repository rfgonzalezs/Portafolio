# Importando datos
df <- read.csv('C:/Users/Raf/Documents/R/Algoritmos hechos por mi/3. Regresion Logistica/Archivos csv/Classification+preprocessed+data+R.csv', header = TRUE)
str(df)
df['price'] <- df['ï..price']
df <- df[,-1]

# Regresion Logistica simple
glm.fit = glm(Sold~price, data=df, family = binomial())
summary(glm.fit)

# Regresion Logistica Multiple
glm.fit = glm(Sold~., data=df, family = binomial())
summary(glm.fit)

glm.probs = predict(glm.fit, type = 'response')
glm.probs[1:10]

glm.predict = rep('NO',506)
glm.predict[glm.probs > 0.5] = 'YES'

table(glm.predict,df$Sold)


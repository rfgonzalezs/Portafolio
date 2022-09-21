#Cargar el archivo de Excel
library(readxl)
library(caTools)
df <- read_excel("C:/Users/Raf/Documents/R/2 Tarea 1/Cardata.xlsx", col_names= TRUE)

#EDD (Extended Data Dictionary)
summary(df)
hist(df$mpg)
pairs(~cyl+disp+HP+wt+accel+mpg, data = df)
barplot(table(df$cyl))
barplot(table(df$disp))
barplot(table(df$HP))
barplot(table(df$wt))
barplot(table(df$accel))
barplot(table(df$mpg))

#multiple Reg lineal
multiple_model <- lm(mpg~.,data =df)
summary(multiple_model)

#Respuesta
#mpg = 46.264 - 0.3979* cyc - 0.0001 * disp -0.0453 * HP -0.0052*wt -0.0291*accel
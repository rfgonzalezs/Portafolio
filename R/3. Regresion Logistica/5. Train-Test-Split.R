# Importando librerias
library(caTools) # Train-Test-Split

# Train-Test-Split
set.seed(0)
split = sample.split(df, SplitRatio = 0.8)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE )

train.fit = glm(Sold~., data = train_set, family = binomial)
test_probs = predict(train.fit, test_set, type = 'response')

test.pred = rep('NO', 120)
test.pred[test_probs>0.5] = 'YES'
table(test.pred, test_set$Sold)

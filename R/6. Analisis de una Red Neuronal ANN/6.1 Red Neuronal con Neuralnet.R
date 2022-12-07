# install.packages("neuralnet")
require(neuralnet)

# Para modelos neuronales simples

hours    = c(20,10,30,20,50,30)
mocktest = c(90,20,20,10,50,80)
Passed   = c(1,0,0,0,1,1)

df = data.frame(hours,mocktest,Passed)
nn = neuralnet(Passed~hours+mocktest, data=df, hidden=c(3,2), act.fct='logistic', linear.output = FALSE)

plot(nn)

thours    = c(20,20,30)
tmocktest = c(80,30,20)
test      = data.frame(thours,tmocktest)

Predict = compute(nn, test)
Predict$net.result
prob <- Predict$net.result
pred <- ifelse(prob>0.5, 1, 0)
pred

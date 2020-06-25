setwd("C:/Users/Ruurd/Google Drive/School/RUG master/Advanced Self-organisation of Social Systems/Project/R")

# This file contains output of netlogo experiment "project-test-4" but without the first few lines which are not CSV
filename = "../experiments/R_Data_6.csv"
data = read.csv(file = filename)
data = subset(data, select = c(population, control ,proportional.turn.modifier, escape.strategy, predator.strategy, catches, losts) )

data$catches.per.attack = data$catches / (data$catches + data$losts)

filtered = data[which(data$proportional.turn.modifier==1000),]


#Plot performance of all strategies
boxplot(catches.per.attack ~ escape.strategy+predator.strategy, data=data[which(data$proportional.turn.modifier==2000 & data$control == 'false'),])

#Plot all proportional turn modifier values
boxplot(catches.per.attack ~ proportional.turn.modifier, data=data[which(data$predator.strategy=='proportional' & data$control == 'true'),])

#Plot direct vs proportional strategy for when control is true (prey moves in straight line, no escape strategy)
boxplot(catches.per.attack ~ predator.strategy, data=filtered[which(filtered$control=='true'),])




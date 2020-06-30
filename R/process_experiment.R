library(ggplot2)


setwd("C:/Users/Ruurd/Google Drive/School/RUG master/Advanced Self-organisation of Social Systems/Project/R")

# This file contains output of netlogo experiment "project-test-4" but without the first few lines which are not CSV
filename = "../experiments/R_Data_5.csv"
data = read.csv(file = filename)
data = subset(data, select = c(population, control ,proportional.turn.modifier, escape.strategy, predator.strategy, catches, losts) )

data$catches.per.attack = data$catches / (data$catches + data$losts)
data[which(is.nan(data$catches.per.attack)),"catches.per.attack"]=0

filtered = data[which(data$proportional.turn.modifier==1000),]

label_font_size = 16

#Plot all proportional turn modifier values
plot_data = data[which(data$predator.strategy=='proportional' & data$control=='true'),]
ggplot(plot_data, aes(x=factor(proportional.turn.modifier), y=catches.per.attack, fill='gray')) + 
  geom_boxplot()+
  labs(
    title="Performance per proportional turn modifier value",
    x="Proportional turn modifier",
    y="Catches per attack",
    fill="Proportional turn modifier"
  ) + 
  theme(
    legend.position = 'none',
    axis.text.x = element_text(size = label_font_size),
    axis.text.y = element_text(size = label_font_size),
    text =  element_text(size = label_font_size)
  )



#Plot performance of all strategies
plot_data = filtered[which(filtered$control == 'false'),]
ggplot(plot_data, aes(x=escape.strategy, y=catches.per.attack, fill=predator.strategy)) + 
  geom_boxplot() +
  labs(
    title="Performance for each predator and escape strategy",
    x="Escape strategy",
    y="Catches per attack",
    fill="Predator strategy"
  ) +
  theme(
    axis.text.x = element_text(size = label_font_size),
    axis.text.y = element_text(size = label_font_size),
    text =  element_text(size = label_font_size)
  )

#Plot direct vs proportional strategy for when control is true (prey moves in straight line, no escape strategy)
plot_data = filtered[which(filtered$control=='true'),]
ggplot(plot_data, aes(x=predator.strategy, y=catches.per.attack, fill=predator.strategy)) + 
  geom_boxplot() + 
  labs(
    title="Proportional vs direct performance for control",
    x="Predator strategy",
    y="Catches per attack"
  ) + 
  theme(
    legend.position = 'none',
    axis.text.x = element_text(size = label_font_size),
    axis.text.y = element_text(size = label_font_size),
    text =  element_text(size = label_font_size)
  )

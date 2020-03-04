library(dslabs)
library(tidyverse)
library(ggthemes)
library(ggrepel)
library(gridExtra)

data(heights)

p <- heights%>% 
  filter(sex=="Male")%>%
  ggplot(aes(x = height))

p + geom_histogram()
#p + geom_histogram(binwidth = 1)
#p+ geom_density()
#p+geom_qq()
p + geom_histogram(binwidth = 1, fill = "blue", col="black")+
  xlab("Male heights in inches")+
  ggtitle("Histogram")

#smooth density plots
p + geom_density(fill="blue")

#quantile - quantile plots
p <- heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = height))
p + geom_qq()

param <- heights %>% 
  filter(sex == "Male")%>%
  summarise(mean = mean(height), sd = sd(height))
p+ geom_qq(dparams = param)+
  geom_abline()

heights %>% 
  ggplot(aes(sample = scale(height)))+
  geom_qq()+
  geom_abline()

p <- heights %>% filter(sex == "Male")%>% ggplot(aes(x = height))
p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")
#arrange plot next to each other in 1 row, 3 columns
grid.arrange(p1,p2,p3,ncol = 3)








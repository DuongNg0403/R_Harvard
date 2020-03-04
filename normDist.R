library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male")%>% pull(height)
1-pnorm(70.5, mean(x), sd(x))#Prob male is taller than 70.5 inches
plot(prop.table(table(x)), xlab = "Height in inches", ylab = "PX(a)")
mean(x<= 71)-mean(x<=69)

pnorm(71, mean(x), sd(x))-pnorm(69, mean(x), sd(x))
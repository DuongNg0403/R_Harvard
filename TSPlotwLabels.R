library(dslabs)
library(tidyverse)

data("gapminder")

labels <- data.frame(country = countries, x = c(1975,1965), y = c(60,72))
gapminder%>% filter(country%in% countries)%>%
  ggplot(aes(year, life_expectancy, col=country))+
  geom_line()+
  geom_text(data= labels, aes(x,y,label = country), size = 5)+
  theme(legend.position = "none")
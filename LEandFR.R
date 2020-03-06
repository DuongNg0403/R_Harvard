library(dslabs)
library(tidyverse)

data("gapminder")

gapminder%>% 
  filter(year %in% c("1962","1980","1990", "2000", "2012")& continent %in%c("Europe", "Asia"))%>%
  ggplot(aes(fertility, life_expectancy, col = continent))+
  geom_point()+
  facet_wrap(.~year)
  


library(dslabs)
library(tidyverse)

data("gapminder")

#add dollars per day variable
gapminder <- gapminder%>% 
  mutate(dollars_per_day = gdp/population/365)

#histogram of dollars per day
past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp))%>%
  ggplot(aes(dollars_per_day))+
  geom_histogram(binwidth = 1, color = "black", fill = "blue")+
  scale_x_continuous(trans = "log2")

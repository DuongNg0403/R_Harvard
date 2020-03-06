library(dslabs)
library(tidyverse)

data("gapminder")
p <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)%>%
  filter(year == "1970"& !is.na(gdp))%>%
  ggplot(aes(region, dollars_per_day))
p + geom_boxplot()+
  #rotate the legends by 90 degree
  theme(axis.text.x = element_text(angle = 90, hjust = 1) )
# by default, factor order is alphabetical
fac <- factor(c("Asia", "Asia", "West", "West", "West"))
levels(fac)
# reorder factor by the category means
value <- c(10, 11, 12, 6, 4)
fac <- reorder(fac, value, FUN = mean)
levels(fac)
# reorder by median income and color by continent
gapminder%>% 
  mutate(dollars_per_day = gdp/population/365)%>%
  filter(year == "1970" & !is.na(gdp))%>%
  mutate(region = reorder(region, dollars_per_day, FUN = median))%>%
  ggplot(aes(region, dollars_per_day, fill = continent))+
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("")+
  scale_y_continuous(trans = "log2")#log scale y axis






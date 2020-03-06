library(dslabs)
library(tidyverse)

data("gapminder")

gapminder %>% filter(country == "United States")%>%
  ggplot(aes(year, fertility))+
#  geom_point()
  geom_line()

# line plot fertility time series for two countries- only one line (incorrect)
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, col = country)) +
  geom_line()
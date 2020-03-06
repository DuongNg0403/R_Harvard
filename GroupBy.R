library(tidyverse)
library(dplyr)
library(dslabs)
data("murders")
data("heights")
# compute separate average and standard 
#deviation for male/female heights
heights %>%
  group_by(sex)%>%
  summarise(average = mean(height), S_D = sd(height))
# compute median murder rate in 4 regions of country
murders <- murders %>%
  mutate(murder_rate = total/population * 10^5)

murders%>%
  group_by(region)%>%
  summarise(median_rate =quantile(murder_rate, .5))
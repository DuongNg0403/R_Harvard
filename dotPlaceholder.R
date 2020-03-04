library(dplyr)
library(tidyverse)
library(dslabs)

data(murders)
#incorrect due to not considering large vs smaller states
murders <- murders %>% mutate(murder_rate = total/population*10^5)
summarise(murders, mean(murder_rate))
# calculate US murder rate, generating a DATA FRAME
us_murder_rate <- murders %>% 
  summarise(rate = sum(total)/sum(population)*100000)
us_murder_rate
#extract the numeric US murder rate with the dot operator
us_murder_rate %>%.$rate
# calculate and extract the murder rate with one pipe
us_murder_rate <- murders%>% 
  summarise(rate = sum(total)/sum(population*10^5))%>%
  .$rate

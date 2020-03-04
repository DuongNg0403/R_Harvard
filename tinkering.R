library(tidyverse)
library(dslabs)
data(murders)

p <- murders%>% ggplot(aes(population/10^6, total, label = abb))
p + geom_point(size =.5)+
  geom_text(nudge_x = 3)+
  geom_text(aes(x = 10, y = 800, label= "Hello"))

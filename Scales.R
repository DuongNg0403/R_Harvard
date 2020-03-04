library(tidyverse)
library(dslabs)

data(murders)
ds_theme_set()
library(ggthemes)
library(ggrepel)
p <- murders%>% ggplot(aes(population/10^6, total, label = abb))
p<-p + geom_point(size = 3)+
  geom_text_repel(nudge_x = .05)+
  scale_x_log10()+ 
  scale_y_log10()+
  xlab("Population in millions (log scale)")+
  ylab("Total number of murders (log scale)")+
  ggtitle("US Gun Murders in 2010")
#scale_x_continuous(trans = "log10")+
  #scale_y_continuous(trans = "log10")
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)
p + geom_point(aes(color = region), size = 3, show.legend = TRUE)+
  geom_abline(intercept = log10(r), lty=2, col = "darkgrey")+
  scale_color_discrete(name = "Region")+ 
  theme_fivethirtyeight()
  #theme_economist()





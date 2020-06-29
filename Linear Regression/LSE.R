# compute RSS for any pair of beta0 and beta1 in Galton's data
library(HistData)
library(tidyverse)
data("GaltonFamilies")
set.seed(1983)
galton_heights <- GaltonFamilies%>%
  filter(gender=="male")%>%
  group_by(family)%>%
  sample_n(1)%>%
  ungroup()%>%
  select(father, childHeight)%>%
  rename(son = childHeight)

rss<- function(beta0, beta1, data){
  resid <- galton_heights$son-(beta0+beta1*galton_heights$father)
  return(sum(resid^2))
}

beta1 <- seq(0,1,len=nrow(galton_heights))
results <-data.frame(beta1 = beta1, rss= sapply(beta1, rss, beta0=25))
results%>% ggplot(aes(beta1,rss))+
  geom_line()+
  geom_line(aes(beta1, rss))

# fit regression line to predict son's height from father's height
fit <- lm(son ~ father, data = galton_heights)
fit

# summary statistics
summary(fit)

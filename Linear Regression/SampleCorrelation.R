# create the dataset
library(tidyverse)
library(HistData)
data("GaltonFamilies")
set.seed(1983)

#Compute sample correlation
R <- sample_n(galton_heights, 25,replace = TRUE)%>%
  summarise(r = cor(father, son))
R
B <- 1000
N <- 25
R <- replicate(B,{
  sample_n(galton_heights, N, replace=TRUE)%>%
    summarise(r = cor(father, son))%>%
    pull(r)
})

qplot(R, geom="histogram", binwidth = .05, color=I("black"))

mean(R)
sd(R)

# QQ-plot to evaluate whether N is large enough
data.frame(R) %>%
  ggplot(aes(sample = R)) +
  stat_qq() +
  geom_abline(intercept = mean(R), slope = sqrt((1-mean(R)^2)/(N-2)))
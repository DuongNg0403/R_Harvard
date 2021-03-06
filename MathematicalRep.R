
library(tidyverse)
library(dslabs)
polls <- polls_us_election_2016 %>%
  filter(state == "U.S." & enddate >= "2016-10-31" &
           (grade %in% c("A+", "A", "A-", "B+") | is.na(grade))) %>%
  mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)

one_poll_per_pollster <- polls %>% group_by(pollster) %>%
  filter(enddate == max(enddate)) %>%
  ungroup()

results <- one_poll_per_pollster %>%
  summarize(avg = mean(spread), se = sd(spread)/sqrt(length(spread))) %>%
  mutate(start = avg - 1.96*se, end = avg + 1.96*se)
#simulated data with X_ij = d + h_i+ e_ij
I<- 5
J<-6
N<- 2000
d<- .021
p<- (d+1)/2
h<- rnorm(I,0,.025)
X<- sapply(1:I, function(i){
  d+rnorm(J, 0, 2*sqrt(p*(1-p)/N))
})


#calculating d>0 with general bias
mu<- 0
tau <- .035
sigma <- sqrt(results$se^2+.025^2)
Y<- results$avg
B<- sigma^2 /(sigma^2+tau^2)

posterior_mean <- B*mu + (1-B)*Y
posterior_se <- sqrt(1/(1/sigma^2+1/tau^2))

1-pnorm(0, posterior_mean, posterior_se)











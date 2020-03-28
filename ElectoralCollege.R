library(tidyverse)
library(dslabs)
data("polls_us_election_2016")
head(results_us_election_2016)

results_us_election_2016 %>% arrange(desc(electoral_votes)) %>% top_n(5, electoral_votes)

results <- polls_us_election_2016 %>%
  filter(state != "U.S." &
           !grepl("CD", "state") &
           enddate >= "2016-10-31" &
           (grade %in% c("A+", "A", "A-", "B+") | is.na(grade))) %>%
  mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100) %>%
  group_by(state) %>%
  summarize(avg = mean(spread), sd = sd(spread), n = n()) %>%
  mutate(state = as.character(state))

results %>% arrange(abs(avg))

results <- left_join(results, results_us_election_2016, by="state")
results
results_us_election_2016 %>% filter(!state %in% results$state)
# assigns sd to states with just one poll as median of other sd values
results <- results%>%
  mutate(sd=ifelse(is.na(sd), median(results$sd, na.rm = TRUE),sd))

mu<- 0
tau<- .02
#Calculating the posterior mean and posterior standard error
results%>% mutate(sigma= sd/sqrt(n()),
                  B= sigma^2/(sigma^2+tau^2),
                  posterior_mean=B*mu+(1-B)*avg,
                  posterior_se=sqrt(1 / (1/sigma^2 + 1/tau^2)))%>%
  arrange(abs(posterior_mean))

#Monte Carlo simulation of Election Night results (no general bias)
clinton_EV <- replicate(1000,{
  results%>%mutate(sigma= sd/sqrt(n()),
                   B= sigma^2/(sigma^2+tau^2),
                   posterior_mean=B*mu+(1-B)*avg,
                   posterior_se=sqrt(1 / (1/sigma^2 + 1/tau^2)),
                   simulated_result=rnorm(length(posterior_mean), posterior_mean, posterior_se),
                   clinton=ifelse(simulated_result>0, electoral_votes, 0))%>%
    summarise(clinton=sum(clinton))%>%
    .$clinton+7 
})
mean(clinton_EV>269)


# histogram of outcomes
data.frame(clinton_EV) %>%
  ggplot(aes(clinton_EV)) +
  geom_histogram(binwidth = 1) +
  geom_vline(xintercept = 269)

#Monte Carlo simulation including general bias
bias_sd <- 0.03


clinton_EV_2 <- replicate(1000, {
  results %>% mutate(sigma = sqrt(sd^2/(n) + bias_sd^2),    # added bias_sd term
                     B = sigma^2/ (sigma^2 + tau^2),
                     posterior_mean = B*mu + (1-B)*avg,
                     posterior_se = sqrt( 1 / (1/sigma^2 + 1/tau^2)),
                     simulated_result = rnorm(length(posterior_mean), posterior_mean, posterior_se),
                     clinton = ifelse(simulated_result > 0, electoral_votes, 0)) %>%    # award votes if Clinton wins state
    summarize(clinton = sum(clinton)) %>%    # total votes for Clinton
    .$clinton + 7    # 7 votes for Rhode Island and DC
})
mean(clinton_EV_2 > 269)    # over 269 votes wins election












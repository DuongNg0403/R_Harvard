# use tidy to return lm estimates and related information as a data frame
library(broom)
library(Lahman)
library(tidyverse)
dat <- Teams%>% filter(yearID%in% 1961:2001)%>%
  mutate(HR_strata= round(HR/G,1),
         BB_per_game = BB/G,
         R_per_game = R/G)%>%
  filter(HR_strata>= .4 & HR_strata<= 1.2)


fit <- lm(R~BB, data = dat)
tidy(fit)

#add confidence intervals with tidy
tidy(fit, conf.int=TRUE)

#pipeline with lm, do, tidy
dat %>%
  group_by(HR)%>%
  do(tidy(lm(R~BB, data = .), conf.int = TRUE))%>%
  filter(term == "BB")%>%
  select(HR,estimate, conf.low, conf.high)
# make ggplots
dat %>%  
  group_by(HR) %>%
  do(tidy(lm(R ~ BB, data = .), conf.int = TRUE)) %>%
  filter(term == "BB") %>%
  select(HR, estimate, conf.low, conf.high) %>%
  ggplot(aes(HR, y = estimate, ymin = conf.low, ymax = conf.high)) +
  geom_errorbar() +
  geom_point()

#inspect with glance
glance(fit)

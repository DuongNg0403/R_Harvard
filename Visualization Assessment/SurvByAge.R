options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex),
         !is.na(Age))%>%
  mutate(Age_group=case_when(Age %in% c(0:8)~"0-8",
                             Age %in% c(10:18)~"10-18",
                             Age %in% c(18:30)~"18-30",
                             Age %in% c(30:50)~"30-50",
                             Age %in% c(50:70)~"50-70",
                             Age %in% c(70:80)~"70-80"))


titanic%>%
  ggplot(aes(Age_group, ..count.., fill = Survived))+
  geom_density(alpha=.2)+
  facet_grid(Age_group~.)
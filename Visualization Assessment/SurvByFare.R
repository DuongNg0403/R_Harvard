options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

titanic%>%
  filter(Fare != 0)%>%
  ggplot(aes(Survived, Fare))+
  geom_boxplot()+
  scale_y_continuous(trans="log2")

titanic%>%
  filter(Fare != 0)%>%
  ggplot(aes(Survived, Fare))+
  geom_jitter(width = .2, alpha=.2)+
  scale_y_continuous(trans="log2")


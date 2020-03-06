options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

titanic%>% 
  ggplot(aes(Age,..count.., fill = Sex))+
  geom_density(alpha=.2)
#  facet_grid(Sex~.)
#BE AWARE
#Proportion vs count

  


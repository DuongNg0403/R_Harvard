options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
#basic barplot of passenger class filled by survival
titanic%>%
  ggplot(aes(Pclass, fill=Survived))+
  geom_bar()
#barplot with proportion
titanic%>%
  ggplot(aes(Pclass, fill=Survived))+
  geom_bar(position = position_fill())

#barplot of survival filled by passenger class
titanic%>%
  ggplot(aes(Survived, fill=Pclass))+
  geom_bar(position = position_fill())

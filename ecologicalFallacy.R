library(tidyverse)
library(dslabs)
data("gapminder")

gapminder <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365)
past_year <- 1970
present_year<- 2010
country_list_1 <- gapminder %>%
  filter(year == past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>%
  filter(year == present_year & !is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1, country_list_2)

# add additional cases
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))

# define a data frame with group average income and average infant survival rate
surv_income <- gapminder%>%
  filter(year %in% present_year & !is.na(infant_mortality)& !is.na(group) & !is.na(gdp))%>%
  group_by(group)%>%
  summarise(income = sum(gdp)/sum(population)/365, infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income%>% arrange(income)

# plot infant survival versus income, with transformed axes
surv_income %>% 
  ggplot(aes(income, infant_survival_rate, label = group, col = group))+
  scale_x_continuous(trans = "log2", limit = c(.25,150))+
  scale_y_continuous(trans = "logit", limit = c(.875,.9981), breaks = c(.85,.90,.95,.99,.995,.998))+
  geom_label(size = 3, show.legend = FALSE)
  
  
















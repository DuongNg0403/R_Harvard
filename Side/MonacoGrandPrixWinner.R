library(tidyverse)
library(rvest)
url <- "https://en.wikipedia.org/wiki/Monaco_Grand_Prix"
h <- read_html(url)
h

table <- h %>% html_nodes("table")
winner <- table[[5]]%>% html_table(fill = T)
head(winner)

winner <- winner[1:3]%>%set_names(c("Year","Driver","Constructor"))
head(winner)

most_win <- winner %>%
  group_by(Driver)%>%
  summarise(wins = n())
arrange(most_win, desc(wins))

most_win_by_team <- winner%>%
  group_by(Constructor)%>%
  summarise(wins = n())
arrange(most_win_by_team, desc(wins))

library(tidyverse)
path <- system.file("extdata", package = "dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")

wide_data <- read_csv(filename)

#tidy date from dslabs
library(dslabs)
data("gapminder")
tidy_data <- gapminder%>%
  filter(country %in% c("South Korea", "Germany"))%>%
  select(country, year, fertility)


#gather wide data to make new tidy data
new_tidy_data <- wide_data%>%
  gather(year, fertility, `1960`:`2015`)
head(new_tidy_data)

class(tidy_data$year)
class(new_tidy_data$year)

# convert gathered column names to numeric
new_tidy_data <- wide_data %>%
  gather(year, fertility, -country, convert = TRUE)
class(new_tidy_data$year)


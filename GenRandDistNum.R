# define x as male heights from dslabs data
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

# generate simulated height data using normal distribution - both datasets should have n observations
n <- length(x)
avg <- mean(x)
s <- sd(x)
simulated_heights <- rnorm(n, avg, s)

data.frame(simulated_heights=simulated_heights)%>%
  ggplot(aes(simulated_heights))+
  geom_histogram(binwidth = 1)

B<- 10000
tallest <- replicate(B, {
  simulated_data <- rnorm(800, avg,s)
  max(simulated_data)

})
mean(tallest>= 7*12)
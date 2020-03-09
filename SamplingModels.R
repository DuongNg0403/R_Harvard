library(tidyverse)
color <- rep(c("Red", "Black", "Green"), c(18,18,2))
n <- 1000
X <- sample(ifelse(color=="Red",-1,1),n, replace = TRUE)#Random variable X
x <- sample(c(-1, 1), n, replace = TRUE, prob = c(9/19, 10/19))# 1000 independent draws
S <- sum(x)    # total winnings = sum of draws
B <- 10000
S <- replicate(B,{
  X<- sample(c(-1,1), n, replace = TRUE, prob = c(9/19,10/19))
  sum(X)#TOtal profit
})

mean(S<0)
s <- seq(min(S), max(S), length = 100)
normal_density<- data.frame(s = s, f = dnorm(s, mean(S), sd(S)))
data.frame(S=S)%>%
  ggplot(aes(S, ..density..))+
  geom_histogram(binwidth = 10)+
  geom_line(data = normal_density, col = "blue", mapping = aes(s, f))
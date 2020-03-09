library(tidyverse)
n <- 1000
loss_per_foreclosure <- -2*10^5
p <- .02
B <- 10000
losses <- replicate(B, {
  default <- sample(c(1,0), n, replace = TRUE, prob= c(p, 1-p))
  sum(default)* loss_per_foreclosure
})
data.frame(losses_in_millions= losses/10^6)%>%
  ggplot(aes(losses_in_millions))+
  geom_histogram(binwidth = .6)
n*(p*loss_per_foreclosure + (1-p)*0)    # expected value 
sqrt(n)*abs(loss_per_foreclosure)*sqrt(p*(1-p))    # standard error

x = - loss_per_foreclosure*p/(1-p)#break even
#1% prob lose money
l <- loss_per_foreclosure
z <- qnorm(0.01)
x <- -l*( n*p - z*sqrt(n*p*(1-p)))/ ( n*(1-p) + z*sqrt(n*p*(1-p)))
x/180000    # interest rate
loss_per_foreclosure*p + x*(1-p)    # expected value of the profit per loan
n*(loss_per_foreclosure*p + x*(1-p)) # expected value of the profit over n loans

B <- 100000
profit <- replicate(B, {
  draws <- sample( c(x, loss_per_foreclosure), n, 
                   prob=c(1-p, p), replace = TRUE) 
  sum(draws)
})
mean(profit)    # expected value of the profit over n loans
mean(profit<0)    # probability of losing money
B <- 10000
p<- .45
N<-100
inside <- replicate(B,{
  X<- sample(c(0,1), size = N, replace = TRUE, prob = c(1-p,p))
  X_hat <- mean(X)
  SE_hat <- sqrt(X_hat*(1-X_hat)/N)
  p>= X_hat-2*SE_hat & p<= X_hat+2*SE_hat
})

mean(inside)
#95% probability that the interval falls on top of ppol
n <- 50
bdays <- sample(1:365,n, replace = TRUE)
any(duplicated(bdays))
result <- replicate(10000,{
  bdays<- sample(1:365,n,replace=TRUE)
  any(duplicated(bdays))
  
})
mean(result)
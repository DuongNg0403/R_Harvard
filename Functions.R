avg <- function(x, arithmetic = TRUE){
  #x is a vector
  s <- sum(x)
  n <- length(x)
  ifelse(arithmetic, s/n, prod(x)^(1/n))
}

x <- 1:100
identical(mean(x), avg(x, arithmetic = FALSE))


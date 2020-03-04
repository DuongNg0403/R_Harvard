library(dslabs)
data("heights")
#define range
a <- seq(min(heights$height), max(heights$height), length = 100)
#computes prob for a single value
cdf_func <- function(x){
  mean(heights$height <= x)
}

cdf_values <- sapply(a, cdf_func)
plot(a, cdf_values)
cdf_func(70)
#Part a: Generate a vector of 1000 normal random numbers with mean 8 and variance 25
norm_vector <- rnorm(1000, mean = 8, sd = 5)

#Part b:  Calculate how many elements in the vector are greater than or equal to 9.
largerthan_nine<- sum(norm_vector>=9)
largerthan_nine

sample_mean <- mean(norm_vector)
standard_deviation <- sd(norm_vector)
sample_mean
standard_deviation

#What are the 25th and 75th percentiles of the normal distribution with mean 8 and variance 25?
norm_25th<- qnorm(.25, mean = 8, sd = 5)
norm_75th<-qnorm(.75, mean = 8, sd = 5)
norm_25th
norm_75th

#What are the 25th and 75th percentiles of the sample of the 1000 normal random numbers
#generated in part (a)?
sample_25th<- quantile(norm_vector, probs = .25)
sample_75th<- quantile(norm_vector, probs = .75)  
sample_25th
sample_75th

#Find ??(0.789) and ??(-0.543). 




uni_sample <- runif(100,0,2)
mean_sample <- mean(uni_sample)
median_sample <- quantile(uni_sample, probs = .5)
largerthan_one <- mean(uni_sample>1)

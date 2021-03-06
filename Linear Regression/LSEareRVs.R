library(HistData)
library(tidyverse)
data("GaltonFamilies")

# Monte Carlo simulation
B <- 1000
N <- 50

lse <- replicate(B,{
  sample_n(galton_heights, N, replace = TRUE)%>%
    lm(son ~ father, data = .)%>%
    .$coef
})

lse <- data.frame(beta_0=lse[1,], beta_1=lse[2,])

# Plot the distribution of beta_0 and beta_1
library(gridExtra)
p1 <- lse %>%
  ggplot(aes(beta_0))+
  geom_histogram(binwidth = 5, color="black")
p2 <- lse%>%
  ggplot(aes(beta_1))+
  geom_histogram(binwidth = .1, color="black")

grid.arrange(p1,p2,ncol=2)

#summary statistics
sample_n(galton_heights, N, replace = TRUE)%>%
  lm(son~father, data = .)%>%
  summary%>%.$coef
lse %>% summarize(se_0 = sd(beta_0), se_1 = sd(beta_1))


lse %>% summarize(cor(beta_0, beta_1))
lse <- replicate(B, {
  sample_n(galton_heights, N, replace = TRUE) %>%
    mutate(father = father - mean(father)) %>%
    lm(son ~ father, data = .) %>% .$coef 
})
cor(lse[1,], lse[2,])

# plot predictions and confidence intervals
galton_heights %>% ggplot(aes(son, father)) +
  geom_point() +
  geom_smooth(method = "lm")

# predict Y directly
fit <- galton_heights %>% lm(son ~ father, data = .) 
Y_hat <- predict(fit, se.fit = TRUE)
names(Y_hat)

# plot best fit line
galton_heights %>%
  mutate(Y_hat = predict(lm(son ~ father, data=.))) %>%
  ggplot(aes(father, Y_hat))+
  geom_line()





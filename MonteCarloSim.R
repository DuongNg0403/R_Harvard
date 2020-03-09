beads <- rep(c("Red", "Blue"), times = c(2,3))
sample(beads,1)
events <- replicate(100000,sample(beads,1))

tab<-table(events)
tab
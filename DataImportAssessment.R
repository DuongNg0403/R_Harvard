library(tidyverse)
url <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
download.file(url, "wdbc.data")

dat<- read_csv("wdbc.data", col_names = FALSE)

head(dat)
nrow(dat)
ncol(dat)
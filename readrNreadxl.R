library(dslabs)
library(tidyverse)
library(readxl)

#inspect the first 3 lines
read_lines("murders.csv", n_max = 3)

# read file in CSV format
dat <- read.csv(filename)

#read using full path
dat <- read.csv(fullpath)

#Ex:
path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
filename1 <- "life-expectancy-and-fertility-two-countries-example.csv"
filename2 <- "fertility-two-countries-example.csv"

dat=read.csv(file.path(path, filename))
dat1=read.csv(file.path(path, filename1))
dat2=read.csv(file.path(path, filename2))

dat3 <- read.csv(filename, stringsAsFactors = FALSE)
class(dat3$abb)


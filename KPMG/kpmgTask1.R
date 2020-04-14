library(tidyverse)
library(readxl)
path <- system.file("KPMG_VI_New_raw_data_update_final.xlsx")
filename <- "KPMG_VI_New_raw_data_update_final.xlsx"
transaction_data <- read_excel(filename, 2)
newcustomerlist_data<- read_excel(filename, 3)
customerdemo_data<- read_excel(filename, 4)
customeraddress_data <- read_excel(filename, 5)

head(transaction_data)
head(newcustomerlist_data)
head(customerdemo_data)
head(customeraddress_data)

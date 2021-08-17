### R Training
### Session 4: Working with Tibbles/Isolating Data with dplyr


# set working directory to project folder
setwd("C:/Users/HOME/Desktop/CDS/R_Training/rtraining")

library(tidyverse)
taxation <- read_csv("data/taxation.csv")

# select columns
taxation %>% select(year, quarter, income_mean, income_median) %>% print()
taxation %>% select(!c(quarter_no, N, income_gini, wealth_mean, wealth_median, wealth_gini))

# select columns starting with "wealth"
taxation %>% select(starts_with("wealth"))

# filter by year 2017 and mean income over 60000
taxation %>% filter(income_mean >60000 & year == 2017)

# arrange rows by year and median wealth
taxation %>% arrange(year, wealth_median)

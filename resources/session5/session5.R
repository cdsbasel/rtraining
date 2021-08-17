### R Training
### Session 5: Derive Information with dplyr


# set working directory to project folder
setwd("C:/Users/HOME/Desktop/CDS/R_Training/rtraining")

library(tidyverse)
taxation <- read_csv("data/taxation.csv")

# create new column
taxation = mutate(taxation, income_labels = case_when(income_mean < 50000 ~ "1",
                                              income_mean >= 50000 & income_mean < 80000 ~ "2",
                                              income_mean >= 80000 & income_mean < 110000 ~ "3",
                                              income_mean >= 110000  ~ "4"))

# count observations by year and quarter
new_taxation = taxation %>% 
  group_by(year, income_labels) %>%
  summarise(number_quarters = n()) %>%
  print()

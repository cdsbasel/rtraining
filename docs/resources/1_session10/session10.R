### R Training
### Session 10: Join Datasets
### 15.08.21

# set working directory to project folder
setwd("C:/Users/HOME/Desktop/CDS/R_Training/rtraining")

library(tidyverse)

# import datasets
taxation <- read_csv("data/taxation.csv")
kennzahlen_basel <- read_csv2("data/kennzahlen_basel.csv") 

# change the variable name in kennzahlen_basel to match taxation
kennzahlen_basel <- kennzahlen_basel %>%
  rename(year = Publikationsjahr,
         quarter = `Wohnviertel Name`)

# join datasets by year and county
combined_data <- taxation %>%
  inner_join(kennzahlen_basel, by = c("year", "quarter"))

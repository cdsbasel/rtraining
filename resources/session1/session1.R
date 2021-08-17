### R Training
### Session 1: Getting Started
### 02.08.21

library(tidyverse)

# read file from url
tourismus <- read_csv("https://raw.githubusercontent.com/cdsbasel/rtraining/main/data/Tourismus.csv")

# inspect dataset
glimpse(tourismus)
summary(tourismus)
tourismus %>% slice_max(Besucher)

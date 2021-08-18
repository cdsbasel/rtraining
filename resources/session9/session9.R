### R Training
### Session 9: Separate and Unite Columns

library(tidyverse)
library(tidyr)

billboard_new = billboard %>%
  separate(date.entered, into = c("year", "month", "date"), sep = "-")

billboard_new %>%
  unite(date.entered, year, month, date, sep = "-", remove = F) 
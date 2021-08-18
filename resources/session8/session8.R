### R Training
### Session 8: Reshape Data


# load packages individually, in order to load the "billboard" dataset
library(tidyr)
library(dplyr)

billboard_longer <- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE,
  )

billboard_longer %>%
  group_by(track) %>%
  summarise(average = mean(rank)) %>%
  arrange(average)

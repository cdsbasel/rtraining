### R Training
### Session 2: Visualization Basics

# set working directory to project folder
setwd("C:/Users/HOME/Desktop/CDS/R_Training/rtraining")

library(tidyverse)
taxation <- read_csv("data/taxation.csv")

# make plot as 'my_plot'
my_plot <- taxation %>%
  arrange(year, income_median) %>%
  mutate(quarter = as_factor(quarter)) %>%
  ggplot(aes(x = year, 
             y = income_median, 
             col = quarter)) +
  geom_line() + 
  geom_point() +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    # reduce legend text size
    legend.text = element_text(size = 7)) +
  labs(x = "Year",
       y = "Median income",
       title = "Inequality in Basel",
       subtitle = "Income development in Basel Quarters",
       caption = "Source: Open Data from Basel City")

# save plot
ggsave(filename = "inequality_basel.png",
       plot = my_plot,
       device = "png",
       path = "resources/session2",
       width = 7, 
       height = 7)
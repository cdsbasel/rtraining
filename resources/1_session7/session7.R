### R Training
### Session 7: Charts and Plots


# set working directory to project folder
setwd("C:/Users/HOME/Desktop/CDS/R_Training/rtraining")

library(tidyverse)
library(scales) # to later add commas to the axis numbers
verbrechen <- read_csv("data/verbrechen.csv")

# for axis numbers
options(scipen=10000)

# make plot as 'my_plot'
my_plot <- verbrechen %>%
  filter(verbrechen == "diebstahl" ) %>%
  group_by(staat) %>%
  summarise(sum = sum(haeufigkeit),
            population = sum(bevoelkerung)) %>%
  ggplot(aes(x = population, 
             y = sum, 
             col = staat)) +
  geom_point(size = 3) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    # reduce legend text size
    legend.text = element_text(size = 9)) +
  labs(x = "Population",
       y = "Frequency",
       title = "Crime in the States",
       subtitle = "Relationship between Population and Frequency of Theft by State",
       caption = "Source: Open Data from UCI Machine Learning Repository") +
  scale_y_continuous(labels = comma) +
  scale_x_continuous(labels = comma)

# save plot
ggsave(filename = "crime_in_the_states.png",
       plot = my_plot,
       device = "png",
       path = "resources/session7",
       width = 7, 
       height = 7)

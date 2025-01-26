## GGPLOT2 - SPATIAL MAP ################################################

## ggLibrary ###################################################################

library(tidyverse)

## Code ########################################################################

ggplot(
  
  # Data Selection
  data = mpg, 
  aes(cty)) + 
  
  # Density Customisations
  geom_density(aes(
    fill=factor(drv)), # Method of Grouping
    alpha=0.4) + # Opacity
  
  # Label Customisation
  labs(x = "City Mileage",
       y = "Density",
       fill="Cylinders")

## GGPLOT2 - SCATTER PLOT ######################################################

## ggLibrary ###################################################################

library(tidyverse)
library(ggalt)

## Example Data ################################################################

data("midwest", package = "ggplot2")
options(scipen = 999)  # turn-off scientific notation like 1e+48

# Eextracting data for circling on plot
midwest_select <- midwest[midwest$poptotal > 350000 & 
                            midwest$poptotal <= 500000 & 
                            midwest$area > 0.01 & 
                            midwest$area < 0.1, ]

## Code ########################################################################

ggplot(
  
  # Data Selection
  data = midwest, 
  aes(x = area, 
      y = poptotal)) +
  
  # geom_point customisation
  geom_point(
    aes(col = state, 
        size = popdensity)) +
  
  # Point Colour Customisation
  scale_color_hue(l=65, c=100) +
  
  ## Note that l=65, c=100 is default. You can also specify with:
  # scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
  
  # Apply a line with a desired function
  geom_smooth(method = "loess", se = F) +
  
  # Axis / Title Customisation
  xlim(c(0, 0.1)) +
  ylim(c(0, 500000)) +
  labs(
    y = "Population",
    x = "Area",
    col = "Legend Name 2",
    size = "Legend Name 1")  +
    # title = "Scatterplot",
    # subtitle = "Area Vs Population",
    # caption = "Source: midwest" 
  
  # Customise Highlighted/Circles regions
  geom_encircle(aes(x=area, y=poptotal), 
                data=midwest_select, 
                color="red", 
                size=2, 
                expand=0.08)   # encircle


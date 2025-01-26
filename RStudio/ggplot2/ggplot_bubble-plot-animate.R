## GGPLOT2 - BUBBLE PLOT #######################################################

## ggLibrary ###################################################################

library(tidyverse)

## Example Data ################################################################

data("midwest", package = "ggplot2")
options(scipen = 999)  # turn-off scientific notation like 1e+48

## Code ########################################################################

mpg_select <- mpg[mpg$manufacturer %in% c("audi", "ford", "honda", "hyundai"), ]

# Scatterplot
ggplot(
  # Data Selection
  data = mpg_select, 
  aes(x = displ, 
      y = cty)) + 
  
  # Jitter Customisation (can use geom_point() instead)
  geom_jitter(aes(col=manufacturer, size=hwy)) + 
  
  # Smooth line function. 
  geom_smooth(aes(col=manufacturer), method="lm", se=F) +
  
  # Customisation of Titles
  labs(x = "X Axis",
       y = "Y Axis",
       size = "Size Legend",
       col = "Col Legend") 
       # title="Bubble chart",
       # subtitle="mpg: Displacement vs City Mileage") +

## Animated Bubble Plot ########################################################

# Key packages for the animation
library(gganimate)
library(gapminder) # data
library(gifski)

ggplot(
  
  # Data Selection
  data = gapminder, 
  aes(
    x = gdpPercap, 
    y = lifeExp, 
    size = pop, 
    colour = country)) +
  
  # Label Customisation
  labs(title = "Year: {frame_time}",
       x = 'GPD per Capita',
       y = 'Life expectancy') +
  
  geom_point(show.legend = FALSE, 
             alpha = 0.7) +
  
  #Applying a colour scale
  scale_color_viridis_d() +
  
  # Apply scalable size
  scale_size(range = c(2, 12)) +
  
  #Setting x axis to a log scale
  scale_x_log10() +

  # Applying the Annimation
  transition_time(year) 

# Saving the Animation:
anim_save('animatedggplot.gif')


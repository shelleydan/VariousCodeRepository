## GGPLOT2 - COUNTS SCATTER PLOT ###############################################

## ggLibrary ###################################################################

library(tidyverse)

## Example Data ################################################################

data("midwest", package = "ggplot2")
options(scipen = 999)  # turn-off scientific notation like 1e+48

## Code ########################################################################

ggplot(
  
  # Data Selection
  data = mpg, 
  aes(
    x = cty, 
    y = hwy)) +
  
  # Count Customisation
  geom_count(
    col="tomato3", 
    show.legend=T) +
  
  labs(y="hwy", 
       x="cty",
       col = "Legend Title")
       # title="Counts Plot",
       # subtitle="mpg: city vs highway mileage", )

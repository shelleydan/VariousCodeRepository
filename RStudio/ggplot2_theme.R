## Setting a Theme for all ggplot2 figures #####################################

## ggLibrary ###################################################################
library(tidyverse)

# This is best practice for maintaining a coherent theme for all plots #########

theme_set(
  theme(
    
    # PLOT TITLE (Not incliuded in Scientific Plots)
    # plot.title = 
    #   element_text(color = 'cornflowerblue',
    #                family = 'Comic Sans MS',
    #                face = 'bold',
    #                hjust = 0.5,
    #                size = rel(2))
    
    # PLOT BACKGROUND
    plot.background = 
      element_rect(fill = 'white',
                   color = 'white',
                   size = 5),
    
    # PANEL BACKGROUND
    panel.background = 
      element_rect(fill = 'white',
                   color = 'white',
                   size = 1),
    
    # GRID LINES (Major/Minor)
    panel.grid.major = 
      element_line(size = 0.6,
                   color = 'lightgray'),
    
    panel.grid.minor = 
      element_line(size = 0.2,
                   color = 'lightgray'),
    
    # AXIS TITLES
    axis.title.x = 
      element_text(face = 'bold',
                   color = 'black',
                   margin = margin(10,0,0,0),
                   size = 10),
    
    axis.title.y = 
      element_text(face = 'bold',
                   color = 'black',
                   margin = margin(0,10,0,0),
                   size = 10,
                   angle = 90),
    
    # AXIS TEXTS
    axis.text.x = 
      element_text(# face = 'bold',
                   colour = 'black',
                   size = 8),
    
    axis.text.y = 
      element_text(# face = 'bold',
                   colour = 'black',
                   size = 8,
                   angle = 0),
    
    # X/Y AXIS LINES
    axis.line = 
      element_line(size = 0.2,
                   color = 'black',
                   linetype = 'solid', 
                   lineend = 'square'),
    
    # AXIS TICKS
    axis.ticks = 
      element_line(size = 0.2,
                   color = 'black'),
    
    # ASPECT RATIO
    aspect.ratio = 1,
    
    # LEGEND BACKGROUND
    legend.background = 
      element_rect(fill = 'white', 
                   color = 'white',
                   size = 0.1),
    
    # LEGEND KEY
    legend.key = 
      element_rect(fill = 'white',
                   color = 'white',
                   size = 0.2),
    
    # LEGEND TITLE
    legend.title = 
      element_text(face = 'bold',
                   color = 'black'),
    
    # LEGEND TEXT
    legend.text = 
      element_text(family = 'Comic Sans MS',
                   face = 'bold',
                   color = 'black'),
    
    # LEGEND POSITION
    legend.position = 'right',
    ## or provide x, y coordinates...
    ## legend.position = c(1,1)
    
    # FACET CUSTOMISATION (rarely used)
    # strip.background  = 
    #   element_rect(fill = 'white',
    #                color = 'black',
    #                size = 0.2),
    # 
    # strip.text = 
    #   element_text(size = 8,
    #                # face = 'bold',
    #                color = 'black'),
    # 
    # panel.spacing = 
    #   unit(2, unit = 'lines')
  )
)

ggplot(mtcars, 
       aes(wt, mpg, 
           colour = factor(cyl))) +
  geom_point() +
  labs(x = 'X Axis',
       y = 'Y Axis') +
  xlim(0,6) +
  ylim(5,35)

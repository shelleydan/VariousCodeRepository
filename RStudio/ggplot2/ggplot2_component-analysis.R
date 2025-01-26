## GGPLOT2 - COMPONENT ANALYSIS ################################################

## ggLibrary ###################################################################

library(tidyverse)
library(ggalt)
library(ggfortify)

## Example Data ################################################################

df <- iris[c(1, 2, 3, 4)]

## PCA ANALYSIS ################################################################

pca_mod <- prcomp(df)  # compute principal components

# Data frame of principal components ----------------------
df_pc <- data.frame(pca_mod$x, Species=iris$Species)  # dataframe of principal components
df_pc_vir <- df_pc[df_pc$Species == "virginica", ]  # df for 'virginica'
df_pc_set <- df_pc[df_pc$Species == "setosa", ]  # df for 'setosa'
df_pc_ver <- df_pc[df_pc$Species == "versicolor", ]  # df for 'versicolor'

# Get the % to add to the Axis
summary(pca_mod)

## Code ########################################################################

ggplot(
  # Data Selection
  data = df_pc, 
  aes(x = PC1, 
      y = PC2, 
      col = Species)) + 
  
  # Point Customisation
  geom_point(
    aes(shape = Species), 
    size=2) +   # draw points
  
  # Label Customisation
  labs(x = "PCA1: 92.5%",
       y = "PCA2: 5.3%") + 
  
  # Axis Customisation
  coord_cartesian(xlim = 1.2 * c(min(df_pc$PC1), max(df_pc$PC1)), 
                  ylim = 1.2 * c(min(df_pc$PC2), max(df_pc$PC2))) + 
  
  # Circle Customisation
  stat_ellipse(geom="polygon", 
               level=0.95, # p threshold
               alpha=0.2, 
               fill = 'white',
               linewidth = 0.75)

  # or...
  
  # geom_encircle(data = df_pc_vir, aes(x=PC1, y=PC2)) +  
  # geom_encircle(data = df_pc_set, aes(x=PC1, y=PC2)) + 
  # geom_encircle(data = df_pc_ver, aes(x=PC1, y=PC2))


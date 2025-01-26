## GGPLOT2 - DENDROGRAM ########################################################

## ggLibrary ###################################################################

library(tidyverse)
library(ggdendro)

## Example Data ################################################################

data <- USArrests

## Code ########################################################################

# Applying a cluster analysis
hc <- hclust(dist(data), "ave")  # hierarchical clustering

# plot
ggdendrogram(
  data = hc, 
  rotate = T, 
  size = 2,
  labels = T,
  leaf_labels = T,
  segments = T)



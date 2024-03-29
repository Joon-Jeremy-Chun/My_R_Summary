#In ggplot2, graphs are created by adding layers to the ggplot object:
#DATA %>% ggplot() + LAYER_1 + LAYER_2 + ... + LAYER_N

#The geometry layer defines the plot type and takes the format geom_X where X is the plot type.
#Aesthetic mappings describe how properties of the data connect with features of the graph (axis position, color, size, etc.) Define aesthetic mappings with the aes function.
#aes uses variable names from the object component (for example, total rather than murders$total).
#geom_point creates a scatterplot and requires x and y aesthetic mappings. 
#geom_text and geom_label add text to a scatterplot and require x, y, and label aesthetic mappings.

#To determine which aesthetic mappings are required for a geometry, read the help file for that geometry.

library(tidyverse)
library(dslabs)
data(murders)

murders %>% ggplot() + geom_point(aes(x = population/10^6, y = total))
#Outcome:plot

# add points layer to 'predefined' ggplot object
p <- ggplot(data = murders)
p + geom_point(aes(population/10^6, total))

# add text layer to scatterplot
p + 
  geom_point(aes(population/10^6, total)) + 
  geom_text(aes(population/10^6, total, label = abb))

# change the size of the points
p + 
  geom_point(aes(population/10^6, total), size = 3) + 
  geom_text(aes(population/10^6, total, label = abb))

# move text labels slightly to the right -> nudge_x 
p + 
  geom_point(aes(population/10^6, total), size = 3) +
  geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)


# simplify code by adding global aesthetic
p <- murders %>% ggplot(aes(population/10^6, total, label = abb))
p + geom_point(size = 3) +
  geom_text(nudge_x = 1)

# local aesthetics override global aesthetics
p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800, label = "Hello World"))
# Note: global label, the abb are disappearing
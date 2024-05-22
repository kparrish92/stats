library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# To select all: CTRL/CMD + A 
# To run: CTRL/CMD + SHIFT + ENTER

penguins

glimpse(penguins)

ggplot(data = penguins)

penguins %>% 
  ggplot()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + geom_point()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()
# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 11 Solutions


# --------------------------------------------------------
# 11.8.1. Exercise 1:

# Load pacakges:

library(tidyverse)
library(broom)

# ... and data:

icon <- read_csv('perry_winter_2017_iconicity.csv')

# Fit model without z-scored predictor:

icon_mdl <- lm(Iconicity ~ SER + CorteseImag +
                   Syst + Freq, data = icon)

# Extract coefficients:

mycoefs <- tidy(icon_mdl, conf.int = TRUE) %>%
  filter(term != '(Intercept)')

# Create coefficient plot:

mycoefs %>% ggplot(aes(x = term, y = estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high),
                width = 0.2) +
  geom_hline(yintercept = 0, linetype = 2) +
  coord_flip() + theme_minimal()

# Notice how the scale of the syst predictor makes...
# ... it almost impossible to see the values ...
# ... of the other coefficients.
# That's why standardizing the predictors (Chapter 7) ...
# ... made a lot of sense!


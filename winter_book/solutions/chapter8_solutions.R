# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 8 Solutions


# --------------------------------------------------------
# 8.8.1. Exercise 1:

# Load packages if you haven't done so already:

library(tidyverse)
library(broom)

# Load data:

icon <- read_csv('perry_winter_2017_iconicity.csv')

# Take subset with adjectives:

these_POS <- c('Noun', 'Verb', 'Adjective')
NVA <- filter(icon, POS %in% these_POS)

# Here I am using an intervening variable "these_POS" ...
# ... this makes the "filter()" line much shorter.
# It's not necessary though...

# Make a model with the interaction:

NVA_int_mdl <- lm(Iconicity ~ SER * POS, data = NVA)

# Investigate model:

tidy(NVA_int_mdl)

# For a three-level categorical predictor, there are...
# ... 2 slopes (2 differences to reference level).
# This means there are two slopes to adjust in an...
# ... interaction. The reference level here is adjectives.



# --------------------------------------------------------
# 8.8.2. Exercise 2:

# Load data:

sim <- read_csv('winter_matlock_2013_similarity.csv')

# Do dummy-coding 'by hand':

sim <- mutate(sim,
              phon01 = ifelse(Phon == 'Similar', 1, 0),
              sem01 = ifelse(Sem == 'Similar', 1, 0),
              int01 = phon01 * sem01)

# Here, the ifelse() function is used to make ...
# ... all "Similar" values to 1, and everything else to 0.
# The interaction is just the multiplication of the two ...
# ... dummy-coded vectors.

# Fit model with interaction:

sim_mdl <- lm(Distance ~ phon01 + sem01 + int01, sim)
tidy(sim_mdl)

# Compare the output to the values in the chapter.
# You should see that the results are exactly the same.
# This should help you understand ...
# ... the underlying math better.



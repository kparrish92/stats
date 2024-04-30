# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 13 Solutions


# --------------------------------------------------------
# 13.8.1. Exercise 1:

# Generate 50 random Poisson distributed data points:

rpois(50, lambda = 2)

# (not saved, run multiple times)

# Plot this:

plot(table(rpois(50, lambda = 2)))

# Play around!:
# - Run this again and again.
# - Plug in different lambda values.
# - Try to break it: What happens when you put in ...
# ... negative numbers?


# --------------------------------------------------------
# 13.8.2. Exercise 2:

# Load packages:

library(tidyverse)
library(broom)

# ...  and data:

lyn <- read_csv('lynott_connell_2009_modality.csv')
ELP <- read_csv('ELP_full_length_frequency.csv')

# Merge:

both <- left_join(lyn, ELP) %>%
	dplyr::select(Word, DominantModality:Smell, Log10Freq)

# Notice that I am using "dplyr::" here because you ...
# ... may have the MASS package loaded from the chapter.
# And unfortunately, MASS contains a select() function ...
# ... as well. With "dplyr::", we avoid naming conflicts.

# Get raw values:

both <- mutate(both, Freq = 10 ^ Log10Freq)

# Reminder: log10 is the opposite of taking something ...
# ... to the power of 10.

# Fit Poisson regression with categorical predictor:

tidy(glm(Freq ~ DominantModality,
         data = both, family = poisson))

# Fit Poisson regression with continuous predictors:

summary(glm(Freq ~ Sight + Taste + Smell + Sound + Touch,
	data = both, family = poisson))

# Fit negative binomial regression:

library(MASS)
xmdl_nb <- glm.nb(Freq ~ Sight + Taste + Smell + Sound + Touch,
	data = both)
summary(xmdl_nb)

# Assess variance inflation factors:

library(car)
vif(xmdl_nb)

# They are fine.

# See whether negative binomial regression is warranted.

library(pscl)
odTest(xmdl_nb)

# There is significant overdispersion...
# ... so a negative binomial model is preferred.



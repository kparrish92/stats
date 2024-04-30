# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 7 Solutions


# --------------------------------------------------------
# 7.12.1. Exercise 1:

# Load packages if you haven't done so already:

library(tidyverse)
library(broom)

# Load data:

senses <- read_csv('winter_2016_senses_valence.csv')

# Check:

senses

# Boxplot:

ggplot(senses,
	aes(x = Modality, y = Val, fill = Modality)) +
		geom_boxplot()

# Create a density graph with facet_wrap:

ggplot(senses,
	aes(x = Val, fill = Modality)) +
		geom_density(alpha = 0.5) +
		facet_wrap(~Modality)


# --------------------------------------------------------
# 7.12.2. Exercise 2:

# Setup. First, load data:

lyn <- read_csv('lynott_connell_2009_modality.csv')
icon <- read_csv('perry_winter_2017_iconicity.csv')

# Then join the two tibbles:

both <- left_join(lyn, icon)

# From the newly joined "both" tibble, extract columns:

both <- select(both, Word, DominantModality, Iconicity)

# Check:

both

# Fit linear model:

icon_mdl <- lm(Iconicity ~ DominantModality, data = both)

# Look at rounded output:

coef_tab <- tidy(icon_mdl) %>% select(term, estimate) %>%
	mutate(estimate = round(estimate, 2))

coef_tab

# To determine the intercept, ask either one of these:
# (1) What level is not(!) listed in the output?
# (2) What is first in the alphabet?

# In this case, the intercept is the 'Auditory' level.
# Since R uses treatment coding by default, all other ...
# ... senses are expressed as differences to the ...
# ... 'Auditory' reference level.

# Let's extract the coefficients:

int <- coef_tab$estimate[1] # intercept
gus <- coef_tab$estimate[2] # 'Auditory-Gustatory' difference
hap <- coef_tab$estimate[3] # 'Auditory-Haptic' difference
olf <- coef_tab$estimate[4] # 'Auditory-Olfactory' difference
vis <- coef_tab$estimate[5] # 'Auditory-Visual' difference

# Do the arithmetic by hand:

int		# prediction for 'Auditory'
int + gus		# prediction for 'Gustatory'
int + hap		# prediction for 'Haptic'
int + olf		# prediction for 'Olfactory'
int + vis		# prediction for 'Visual'

# Or ask predict() to fill the regression equation out for you:

newdf <- tibble(DominantModality = unique(both$DominantModality))

# (Defines a tibble with the values to generate predictions for)
# Use this tibble and the model to append predictions:

newdf$fit <- predict(icon_mdl, newdf)

# Check this:

newdf

# Compare to descriptive averages:

both %>% group_by(DominantModality) %>%
	summarize(Iconicity = mean(Iconicity, na.rm = TRUE))

# The main point of this exercise is to be able to ...
# ... reconstruct values from treatment coded predictors.



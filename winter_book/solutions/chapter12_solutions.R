# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 12 Solutions


# --------------------------------------------------------
# 12.8.1. Exercise 1:

# Load packages if you haven't done so already:

library(tidyverse)
library(broom)

# Load data:

ges <- read_csv('hassemer_winter_2016_gesture.csv')

# Convert the response to factor:
# (see chapter for explanations)

ges <- mutate(ges, choice = factor(choice))

# Center the pinkie curl predictor:

ges <- mutate(ges,
	pinkie_c = pinkie_curl - mean(pinkie_curl))

# Choice as a function of centered pinkie curl:

ges_mdl_c <- glm(choice ~ pinkie_c,
               data = ges, family = 'binomial')

# Check coefficients:

tidy(ges_mdl_c)

# The intercept is now the predicted log odds of 'shape'
# ... for a word with average pinkie curl:

tidy(ges_mdl_c)[1, ]$estimate

# Get the predicted probability by applying the logistic:

plogis(tidy(ges_mdl_c)[1, ]$estimate)



# --------------------------------------------------------
# 12.8.2. Exercise 2:

# Fit model with index curve:

both_mdl <- glm(choice ~ pinkie_curl + index_curve,
	data = ges, family = 'binomial')

# Check coefficients:

tidy(both_mdl)

# More index-curved fingers = more shape responses.

# Compare to descriptive proportions:

index_tab <- with(ges, table(index_curve, choice))

# Check:

index_tab

# Check proportions:

prop.table(index_tab, 1)

# The "1" in here stands for row-wise proportions.
# "2" would compute column-wise proportions.

# You may want to center the index curve predictor ...
# ... and add both predictors as centered variables.
# This would make the intercept more interpretable.


# --------------------------------------------------------
# 12.8.3. Exercise 3:

# Center and square pinkie curl:

ges <- mutate(ges,
	pinkie_c = pinkie_curl - mean(pinkie_curl),
	pinkie_c2 = pinkie_c ^ 2)

# Incorporate squared predictor:

ges_mdl2 <- glm(choice ~ pinkie_c + pinkie_c2,
	data = ges, family = 'binomial')

# Assess:

tidy(ges_mdl2)

# There still is a significant linear effect.
# On top of that there is a quadratic effect.
# Because it's negative, it is an inverse U-shape.
# (See Chapter 8 for explanations)

# This is perhaps difficult to conceptualize.
# So let's compute predictions:

ges_preds <- tibble(pinkie_c = sort(unique(ges$pinkie_c)),
	pinkie_c2 = pinkie_c ^ 2)

# Check:

ges_preds

# Compute predictions:

ges_preds$LogOdds <- predict(ges_mdl2, ges_preds)

# And probabilities:

ges_preds <- mutate(ges_preds,
	Probs = plogis(LogOdds))

# Check:

ges_preds

# Notice that high pinkie curl variables are still...
# ... low in predicted 'shape' responses. But the very ...
# ... high pinkie curl variables are also slightly less.

# This is best seen in a quick-and-dirty base R plot:

plot(ges_preds$Probs, type = 'b')




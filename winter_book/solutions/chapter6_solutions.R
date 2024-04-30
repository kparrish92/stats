# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 6 Solutions


# --------------------------------------------------------
# 6.7.1. Exercise 1:

# Load packages if you haven't done so already:

library(tidyverse)
library(broom)

# Load data:

ELP <- read_csv('ELP_full_length_frequency.csv')

# Check:

ELP

# Create model with two predictors:

ELP_mdl <- lm(RT ~ Log10Freq + length, data = ELP)

# Here, RT is regressed on frequency and length together.

# Check overall model performance:

glance(ELP_mdl)

# This model has quite a high R-squared. r ~= 0.49
# In plain English: About 50% of the variance in RTs ...
# ... is described by variation in frequency ...
# ... and word length.

# Check the coefficients of the model:

tidy(ELP_mdl)

# For each increase in log-frequency by 1, RTs ...
# ... drop by 70ms. If you are not a psycholinguist ...
# ... this may not mean much to you. But if you are ...
# ... a psycholinguist, you'd know that this is ...
# ... a BIG effect.

# Check variance inflation factors:

library(car)
vif(ELP_mdl)

# No problem whatsoever with VIFs. These are as ...
# ... close as it gets to 1.0.

# Check assumptions:

par(mfrow = c(1, 3))
hist(residuals(ELP_mdl))
qqnorm(residuals(ELP_mdl))
qqline(residuals(ELP_mdl))
plot(fitted(ELP_mdl), residuals(ELP_mdl))

# Q-Q plot: The residuals show clear positive skew...
# ...indicating a violation of the normality assumption.
# The residual plot shows clear heteroskedasticity.
# The "par()" command above sets up a plotting matrix ...
# ... with a row of 1 and 3 columns.

# Notice that I am using base R functions here ...
# ... which turns out to be a little easier.

# See whether log-transforming RT helps:
# Generate log RT response:

ELP <- mutate(ELP,
	LogRT = log(RT))

# Fit model with logRT:

ELP_logmdl <- lm(LogRT ~ Log10Freq + length, data = ELP)

# Check assumptions again:

par(mfrow = c(1, 3))
hist(residuals(ELP_logmdl))
qqnorm(residuals(ELP_logmdl))
qqline(residuals(ELP_logmdl))
plot(fitted(ELP_logmdl), residuals(ELP_logmdl))

# Slightly better, but still pretty bad.
# Commentary: Response times are often analyzed ...
# ... using ANOVAs, t-tests, or regression models ...
# ... all of which share a similar set of distributional ...
# ... assumptions. Log-transforming alleviates this.
# That said, there are more advanced approaches to ...
# ... modeling RTs using other distributions, such as ...
# ... the gamma distribution. These won't be discussed ...
# ... in this introductory book.



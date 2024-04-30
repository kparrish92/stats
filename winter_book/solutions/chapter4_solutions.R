# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 4 Solutions


# --------------------------------------------------------
# 4.10.1. Exercise 1:

# Just in case you don't have broom and tidyverse loaded:

library(tidyverse)
library(broom)

# Load data:

ELP <- read_csv('ELP_frequency.csv')

# Check:

ELP

# Log-transform frequency data:

ELP <- mutate(ELP, Log10Freq = log10(Freq))

# Check:

ELP

# Fit a model and inspect it:

xmdl <- lm(RT ~ Log10Freq, data = ELP)

# Inspect using the broom function tidy():

tidy(xmdl)

# The same in base R:

summary(xmdl)

# Make a plot corresponding to the model:

ggplot(ELP, aes(x = Log10Freq, y = RT)) +
	geom_point() + geom_smooth(method = 'lm') +
	geom_hline(aes(yintercept = mean(RT))) +
	theme_minimal()

# Or with text instead of points:

ggplot(ELP, aes(x = Log10Freq, y = RT, label = Word)) +
	geom_text() + geom_smooth(method = 'lm') +
	geom_hline(aes(yintercept = mean(RT))) +	
	theme_minimal()



# --------------------------------------------------------
# 4.10.2. Exercise 2:

# Just in case you don't have the random values anymore:

x <- rnorm(50)
y <- 3 * x + rnorm(50)

# This is fitting the model:

xmdl <- lm(y ~ x)

# And the corresponding null model:

xmdl_null <- lm(y ~ 1)

# Extract the residuals into an object called "res":

res <- residuals(xmdl)

# This is strictly speaking not necessary, but it makes ...
# ... the code below easier.

# Extract the residuals of the null model:

res_null <- residuals(xmdl_null)

# Square the residuals of the full model:

sum(res ^ 2)

# Square the residuals of the null model:

sum(res_null ^ 2)

# This is the formula for R-squared:

1 - (sum(res ^ 2) / sum(res_null ^ 2))

# Explanation: It's the sum of squared error of ...
# ... the model over the sum of squared error of ...
# ... the null model. The resultant number is ...
# ... how much is left "unexplained". One minus ...
# ... that quantity is how much is "explained".

# Compare this to the output of the linear model ...
# ... using the broom function "glance()":

glance(xmdl)$r.squared

# Or without broom using the base R summary:

summary(xmdl)





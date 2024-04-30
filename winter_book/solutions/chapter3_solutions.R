# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 3 Solutions


# --------------------------------------------------------
# 3.10.1. Exercise 1:

# Load data:

war <- read_csv('warriner_2013_emotional_valence.csv')

# ggplot2 histogram of valence with mean line:

war %>% ggplot(aes(x = Val)) +
	geom_histogram() +
	geom_vline(aes(xintercept = mean(Val)), linetype = 2)

# The linetype = 2 argument makes the line dashed.
# Notice how geom_vline() has its own aesthetic.

# Feel free to play with colors etc. In general, ...
# ... for all exercises in this book, feel free to PLAY!
# Playing with commands helps you learn!

# Here's the same with a colored histogram and theme:

war %>% ggplot(aes(x = Val)) +
	geom_histogram(fill = 'steelblue', col = 'black') +
	geom_vline(aes(xintercept = mean(Val)),
	               linetype = 2) +
	theme_minimal()



# --------------------------------------------------------
# 3.10.2. Exercise 2:

# This is how to create the density graph:

war %>% ggplot(aes(x = Val)) +
	geom_density(fill = 'peachpuff') +
	geom_vline(aes(xintercept = mean(Val)))



# --------------------------------------------------------
# 3.10.3. Exercise 3:

# 68% should lie between these two values:

5.25 - 0.4
5.25 + 0.4

# You expect 95% of the data to lie between:

5.25 - (2 * 0.4)
5.25 + (2 * 0.4)

# For the 95% rule, we multiply the standard deviation ...
# ... times two.

# However, remember that this is assuming normality.
# In fact, a rating scale is discrete because ...
# ... there are no values between 1 and 2, 2 and 3 etc.
# As a result, the 68%-95% rule can produce odd results.
# Still, depending on how the ratings are distributed ...
# ... the rule may give you a rough indicate of where ...
# ... the data lies. Just keep in mind that it's only ...
# ... a rule of thumb!

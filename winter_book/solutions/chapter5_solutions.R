# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 5 Solution


# --------------------------------------------------------
# 5.9.1. Exercise 1:

# Execute the following code alltogether which will ...
# ... generate the data seen in Figure 5.6.

# This was the code that was used to generate the data:

set.seed(666)   # set seed value for reproducible values

# 50 random x values:

x <- rnorm(50)

# First dataset (top-left):

y1 <- 3 * x

# Second dataset (top-middle):

y2 <- 5 * x + rnorm(50, sd = 1)

# And so on for the other plots...

y3 <- -6 * x + rnorm(50, sd = 4.5)
y4 <- 2 * x + rnorm(50, sd = 4.5)
y5 <- rnorm(50, sd = 100)
y6 <- -2 * x + rnorm(50, sd = 3.5)

# x stays the same; y is changed.

# These are the correlation values in R ...
# ... from left-to-right and top-to-bottom in Figure 5.6:

cor(x, y1)
cor(x, y2)
cor(x, y3)
cor(x, y4)
cor(x, y5)
cor(x, y6)

# Compare these values to your "guesstimates".
# Here is a description:
# 1st plot: r = 1.0; this is a perfect correlation
# 2nd plot: r = 0.99; near-perfect correlation
# 3rd plot: r = -0.76; strong negative correlation
# 4th plot: r = 0.35; medium positive correlation
# 5th plot: r ~ 0; basically no correlation
# 6th plot: r = -0.67; reasonably strong negative cor

# Overall, it's not important to be spot-on in this...
# ... exercise. It's all about gauging your intuition.
# Over time, your intuition as to how strong and ...
# ... weak correlations look like will improve.

# An important skill to acquire is the ability to ...
# ... estimate numbers and not obsess about the details.
# The software gives you the precise numbers, but ...
# ... it's good to look at plots and think about ...
# ... what the corresponding numerical values ...
# ... would be ROUGHLY.


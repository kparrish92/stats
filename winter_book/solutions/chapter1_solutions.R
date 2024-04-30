# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 1 Solutions

# --------------------------------------------------------
# 1.17.1: Exercise 1:
# Here is ONE example smiley...
# ... there's no right or wrong here:

plot(x = 1, y = 1, type = 'n',
     xlim = c(-2, 2), ylim = c(-2, 2))
points(x = -1, y = 1)
points(x = 1, y = 1)
segments(x0 = -0.5, y0 = -1, x1 = 0.5, y1 = -1)
segments(x0 = -1, y0 = -0.5, x1 = -0.5, y1 = -1)
segments(x0 = 0.5, y0 = -1, x1 = 1, y1 = -0.5)

# Feel free to explore here:
# What about adding some eyelashes?
# Or what abut adding a nose?
# All you need to do is create additional ...
# ... points or segments.



# --------------------------------------------------------
# 1.17.2: Exercise 2:

# No solutions necessary.
# Complete as much of 'swirl' as your time allows.
# Swirl is fun — the more you do, the better.
# You never know when the extra R that you'll learn there
# ... will become useful!



# --------------------------------------------------------
# 1.17.3: Exercise 3:
# The following code produces two error messages.
# Run the code first to have a look at the error messages:

x_values <- c(1, 2 3, 4, 5, 6, 7, 8, 9)
mean_x <- mean(X_values)

# The first issue is that there's a comma missing ...
# ... between '2' and '3':

x_values <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# The second issue is that the mean is taken ...
# ... of the variable "X_values", but it's "x_values".
# Remember: R is case-sensitive! It's very unforgiving!

mean_x <- mean(x_values)

# Check content:

mean_x



# --------------------------------------------------------
# 1.17.4: Exercise 4:

# The following two lines return a warning message:

x <- c(2, 3, 4, '4')
mean(x)

# Vectors can only be EITHER numeric OR character...
# ... the quotation marks 'coerce' the vector to be...
# ... character, which can be undone as follows:

x <- as.numeric(x)
mean(x)

# Alternatively, you could fix this issue by correcting ...
# ... the assign statement:

x <- c(2, 3, 4, 4)
mean(x)

# This time the "4" is not in quotes, which means it's ...
# ... actually treated as a number.



# --------------------------------------------------------
# 1.17.5: Exercise 5:

# Load the data if you haven't done so already:
# (You may have to set your working directory, ...
# ... as described in the chapter)

nettle <- read.csv('nettle_1999_climate.csv')

# This returns an error message:

nettle[nettle$Country = 'Yemen', ]

# Why? Because the "equals" statement isn't ... 
# ... just one "=", it's two!

nettle[nettle$Country == 'Yemen', ]

# This now correctly retrieves the row for Yemen.



# --------------------------------------------------------
# 1.17.6: Exercise 6:

# Check the data frame:

head(nettle)

# Do this exercise with the book first, then ...
# ... check solutions here.

# Extracts second row ('Angola'), fifth column ('Langs'):

nettle[2, 5]

# Remember: Before the comma is rows, after the comma ...
# ... is columns.
# In R, the order is generally "rows before columns".

# This extracts first four rows:

nettle[1:4, ]

# Check what happens if you just type in "1:4".
# The colon operator creates an integer sequence.
# This integer sequence can be used for indexing.

# Extract first four rows, first two columns:

nettle[1:4, 1:2]

# Extract row for 'Bangladesh':

nettle[nettle$Country == 'Bangladesh', ]

# Extract row for 'Bangladesh', fifth column:

nettle[nettle$Country == 'Bangladesh', 5]

# Same thing, just stacked on top of each other:

nettle[nettle$Country == 'Bangladesh', ][, 5]

# Explanation: The output of the first bracket ...
# ... is a two-dimensioal data frame. this itself ...
# ... can be indexed. In this case, extracting ...
# ... fifth column.

# Same thing, using '$' and the column's name:

nettle[nettle$Country == 'Bangladesh', ]$Langs

# Whenever possible, index things by name.
# This is because column orders may change if the ...
# ... data changes. Column names less likely so.

# Same thing:

nettle[nettle$Country == 'Bangladesh', 'Langs']

# This shows you that you can also add characters ...
# ... into the column field (after the comma).

# First four rows, second element of 'Langs' column:

nettle[1:4, ]$Langs[2]

# The result of "nettle[1:4, ]$Langs" is a vector ...
# ... of which you can index the second element.

# First four rows, 'Country' and 'Langs' columns:

nettle[1:4, c('Country', 'Langs')]

# This shows you how to index multiple columns ...
# ... at the same time in base R. Notice that ...
# ... because you know index two colmns, the ...
# ... resulting object is a data frame, not a vector.

head(nettle[,])

# head() yields first six rows. Not having anything...
# ... inside the brackets means "no restrictions" on...
# ... rows or columns = all rows and columns.




# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 2 Solutions


# --------------------------------------------------------
# 2.11.1: Exercise 1:

# No solutions necessary. It's HIGHLY recommended to ...
# ... check the style guide, and to check it again at ...
# ... a later time to continuously improve your style.
# Writing clean code is really important!



# --------------------------------------------------------
# 2.11.2: Exercise 2:

# The solution is a separate Markdown file in ...
# ... the folder called "exercise_2.11.2.Rmd".



# --------------------------------------------------------
# 2.11.3: Exercise 3:

# Just in case you haven't loaded this yet:

library(tidyverse)

# Load Nettle (1999) data:

nettle <- read.csv('nettle_1999_climate.csv')

# You may have to set your working directory if ...
# ... you started a new session. Won't be said anymore ...
# ... from now on.

# Notice that I am using the "read.csv()" function here.
# Perhaps "read_csv()" would've been better so that ...
# ... everything is already a tibble and so that ...
# ... character columns are not factor coded.

# Display first six rows:

head(nettle)

# Get only the row for 'Benin':

filter(nettle, Country == 'Benin')

# Get the rows of 'Benin' and 'Zaire':

filter(nettle, Country %in% c('Benin', 'Zaire'))

# Remember that you can think of "%in%" as an extended ...
# ... version of "==". Use it whenever you have ...
# ... more than one thing on the right-hand side.

# Select the 'Langs' column:

select(nettle, Langs)

# Get the 'Langs' column for the 'Benin' row:

filter(nettle, Country == 'Benin') %>%
	select(Langs)

# That is, hoow many languages are spoken in Benin?

# Get the columns from 'Population' to 'MGS' for 'Benin':

filter(nettle, Country == 'Benin') %>%
	select(Population:MGS)

# The colon operator retrieves a sequence of columns.

# Extract all languages that have more than 200 languages:

filter(nettle, Langs > 200)

# This is excluding countries that have exactly 200.
# If you want to include these, use ">=" instead of ">".

# Rows with countries that have more than 200 languages...
# ...and below the sample-median in population size:

filter(nettle, Langs > 200,
	Population < median(Population))

# If you want to include those that are exactly at ...
# ... the median, use "<="



# --------------------------------------------------------
# 2.11.4: Exercise 4:

# The following is the (cumbersome) code that forms the...
# ... basis of this exercise:

# Reduce the nettle tibble to small countries:

smallcountries <- filter(nettle, Population < 4)

# Create categorical MGS variable:

nettle_MGS <- mutate(smallcountries,
	MGS_cat = ifelse(MGS < 6, 'dry', 'fertile'))

# Group tibble for later summarizing:

nettle_MGS_grouped <- group_by(nettle_MGS, MGS_cat)

# Compute language counts for categorical MGS variable:

summarize(nettle_MGS_grouped, LangSum = sum(Langs))

# In a pipeline, the intervening tibbles don't have...
# ... to be created:

nettle %>%
	filter(Population < 4) %>%
	mutate(MGS_cat = ifelse(MGS < 6,
		'dry', 'fertile')) %>%
	group_by(MGS_cat) %>%
	summarize(LangSum = sum(Langs))

# Notice how much more compact this code is.
# Remember that this works like a pipeline in a factory.
# The output of each step is a data frame.

# It's up to you whether you prefer to assign ...
# ... new data frames, or whether you want to use ...
# ... the pipe. The latter is preferred for simple ...
# ... "look-ups" or things that you won't use later.
# If you want to make permanent changes to a ...
# ... data frame, you need to use assign statement.




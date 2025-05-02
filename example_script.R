# view -> panes -> Console on right 
# Tools -> global options -> appearance 
library(tidyverse)

sdsc = 100
name = rnorm(n = sdsc, mean = 0, sd = 1)

mean(name)
sd(name)

df = data.frame(score = rnorm(n = 5000, mean = 75, sd = 10))


df %>% 
  ggplot(aes(x = score)) + geom_histogram(binwidth = 3)
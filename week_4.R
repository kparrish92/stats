install.packages("devtools")
devtools::install_github("jvcasillas/untidydata")

library(tidyverse)

vowels = untidydata::spanish_vowels
    

### 1. Make a plot using one data set

vowels %>% 
  ggplot(aes(x = f1, y = f2)) + geom_point()

### 2. Report some descriptive statistics (mean and sd)

vowels %>% 
  group_by(rep) %>% 
  summarise(mean_f1 = mean(f1))

### 3. Run a t-test of one comparison. 
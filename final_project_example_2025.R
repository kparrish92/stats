## Load libraries 

library(tidyverse)
library(here)

## Load data 

vot_data = read.csv(here("data", "data_voto.csv"))

## check how many unique plosives there are in the data:

unique(vot_data$Plosive)

## I want to plot a box plot for VOT for each of the 6 plosives:

length(unique(vot_data$Participant))

voiceless_data = vot_data %>% 
  filter(Voicing == "voiceless")

# plot the data 
voiceless_data %>% 
  ggplot(aes(x = Plosive, y = VOT)) + geom_boxplot()


# What is the mean and sd of all 3 plosives?

voiceless_data %>% 
  group_by(Plosive) %>% 
  summarise(mean_vot = mean(VOT), sd_vot = sd(VOT))

# Run a t-test 

## tidy this data so that 1 persons mean is in one row 

t_test_data = voiceless_data %>% 
  group_by(Plosive, Participant) %>% 
  summarise(mean_vot = mean(VOT), sd_vot = sd(VOT))

## filter for K and P

k_data = t_test_data %>% 
  filter(Plosive == "k")

p_data = t_test_data %>% 
  filter(Plosive == "p")

## use filtered data for a t.test 
t.test(k_data$mean_vot, p_data$mean_vot)


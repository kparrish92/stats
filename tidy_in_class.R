install.packages("devtools")
devtools::install_github("jvcasillas/untidydata")

library(untidydata)
library(tidyverse)

language_diversity = untidydata::language_diversity

# Which continent has the most languages on average per country? 

unique(language_diversity$Continent)

unique(language_diversity$Measurement)

language_diversity_lang_only = language_diversity %>% 
  filter(Measurement == "Langs")

language_diversity_lang_only %>% 
  group_by(Continent) %>% 
  summarise(mean_languages = mean(Value), sd_languages = sd(Value))

# Predict mean languages by continent 

model = lm(Value ~ Continent, data = language_diversity_lang_only)

summary(model)


pre_post = untidydata::pre_post

vot = untidydata::vot
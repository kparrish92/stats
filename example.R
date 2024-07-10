library(tidyverse)

lang = untidydata::language_diversity %>% 
  filter(Measurement == "Area") # filter for area 
 
lang %>% 
  group_by(Continent) %>% 
  summarize(mean_area = mean(Value),
            sd_area = sd(Value))


example_2 = untidydata::language_diversity %>% 
  filter(Measurement == "Population" & Continent == "Africa" | 
           Measurement == "Population" & Continent == "Asia")


t.test(Value ~ Continent, data = example_2)


example_2 %>% 
  ggplot(aes(x = Continent, y = Value)) + geom_boxplot()
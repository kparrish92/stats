# Empathy data set 

# Get the file:  
# Put it in a folder called "data" 
library(here)
library(tidyverse)

wh_q_df = exp %>% 
  filter(sentence_type == "interrogative-total-yn")


model1 = lm(correct_pct ~ lextale_avg + eq_score, data = wh_q_df)

summary(model1)

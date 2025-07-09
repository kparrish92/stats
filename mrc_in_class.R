# Empathy data set 

# Get the file: https://github.com/kparrish92/stats/blob/main/slides/week6/data/empathy_data.csv
# Put it in a folder called "data" 
library(here)
library(tidyverse)


## Load the data. This line assumes your R script is saved in the same folder a subfolder called "data"
eq_data = read.csv(here("data", "empathy_data.csv")) %>% 
  select(-X) %>% 
  select(-n)

## The data has 5 columns:

### participant - the id of the participants who took the study
### sentence_type - 4 total, either questions (wh- or yes-no) or statements (broad or narrow focus)
### correct_pct - the percentage of correct answers (out of 16 total per type)
### lextale_avg - score on the proficiency test
### eq_score - score on the empathy test

## Here are the 4 sentence types:

unique(eq_data$sentence_type)

### Do empathy and proficiency predict correctness on the task?
### Example:

## Filter the data for just one question type:

inter_yn_df = eq_data %>% 
  filter(sentence_type == "declarative-broad-focus")

## Fit a model predicting percentage correct as a function of empathy score (eq_score)
model1 = lm(correct_pct ~ eq_score, data = inter_yn_df)

## evaluate the model
summary(model1)

## Add the second predictor (lextale)

model2 = lm(correct_pct ~ eq_score + lextale_avg, data = inter_yn_df)

## evaluate the model
summary(model2)

### Are there effects for the other 3 question types? 

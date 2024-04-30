# Statistics for Linguits: An Introduction Using R
# Author: Bodo Winter
# Chapter 15 Solutions


# --------------------------------------------------------
# 15.11.1. Exercise 1: Perform likelihood ratio test

# Load packages:

library(tidyverse)
library(lme4)
library(afex)

# Setting up the data:

selfie <- read_csv('ruth_page_selfies.csv')

# We need to factor-code the "UglyCat" response ...
# ... to fit a logistic regression model.

selfie <- mutate(selfie, UglyCat = factor(UglyCat))

# Fit the full model:

ugly_mdl <- glmer(UglyCat ~ Angle + 
                    (1 + Angle|ID), data = selfie,
                  family = 'binomial',
                  control =
                    glmerControl(optimizer = 'bobyqa'))

# Reminder: This model has a fixed effect "Angle" ...
# ... and a random effect for "ID", which relates ...
# ... to the subjects. The "1|ID" bit does the ...
# ... random intercepts. In addition, there's ...
# ... random slopes for the Angle predictor. This ...
# ... means that different individuals have ... 
# ... different slopes.
# The optimizer is changed to facilitate covergence.

# Fit the corresponding null model:

ugly_null <- glmer(UglyCat ~ 1 + 
                    (1 + Angle|ID), data = selfie,
                  family = 'binomial',
                  control =
                    glmerControl(optimizer = 'bobyqa'))

# Model comparison via likelihood ratio tests:

anova(ugly_null, ugly_mdl)

# This indicates a "significant" difference between ...
# ... the models. Since the only thing that's different ...
# ... is the Angle predictor, this is equivalent to ...
# ... the significance of the Angle predictor.

# Do the same with afex:

ugly_afex <- mixed(UglyCat ~ Angle + 
                     (1 + Angle|ID), data = selfie,
                   family = 'binomial',
                   control =
                     glmerControl(optimizer = 'bobyqa'),
                   method = 'LRT',
                   check_contrasts = FALSE)

# Check the output:

ugly_afex



# --------------------------------------------------------
# 15.11.2. Exercise 2: 

# Extract fixed effect coefficients:

int <- fixef(ugly_mdl)[1]
to_level <- fixef(ugly_mdl)[2]

# Predicted probability for 'from below' angle:

plogis(int + 0 * to_level)

# Sames as:

plogis(int)
# ~0.71 ugly

# Predicted probability for 'level' angle:

plogis(int + 1 * to_level)
# only ~0.36 ugly




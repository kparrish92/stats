

school_a = data.frame(
  score = rnorm(n = 100, mean = 80, sd = 20)
) %>% 
  mutate(school = "school_a") 

school_b = data.frame(
  score = rnorm(n = 100, mean = 50, sd = 20)
) %>% 
  mutate(school = "school_b")

school_data = rbind(school_a, school_b)

library(truncnorm)
n_ppl = 100
years = rtruncnorm(n = n_ppl, a=0, b=15, mean=8, sd=4)
scores = rnorm(n = n_ppl, mean = 50, sd = 20)
eff_per_year = 3

years_data = 
  data.frame(years_learning = years, test_score = scores + eff_per_year*years)

years_data %>% 
  ggplot(aes(x = years_learning, y = test_score)) + geom_point() + geom_smooth(method = "lm")


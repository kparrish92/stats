#set.seed(1)
mean_school_a = 80
mean_school_b = 70 # true mean difference is 10 or .5 standard deviations (cohen's d)

sd_school_a = 20 # pooled standard deviation is 20
sd_school_b = 20

n_per_group = 20

school_a_data = rnorm(n = n_per_group, mean = mean_school_a, sd = sd_school_a)

school_b_data = rnorm(n = n_per_group, mean = mean_school_b, sd = sd_school_b)


mean(school_a_data) - mean(school_b_data)

t.test(school_a_data, school_b_data)
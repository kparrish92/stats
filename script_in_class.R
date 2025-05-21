#set.seed(1)
  
mean_school_a = 80
mean_school_b = 70 # true mean difference is 10 or .5 standard deviations (cohen's d)

sd_school_a = 20 # pooled standard deviation is 20
sd_school_b = 20

n_per_group = 40 # how many observations do we need?

school_a_data = rnorm(n = n_per_group, mean = mean_school_a, sd = sd_school_a)

school_b_data = rnorm(n = n_per_group, mean = mean_school_b, sd = sd_school_b)

mean(school_a_data) - mean(school_b_data)

t.test(school_a_data, school_b_data)

container = list()

for (i in 1:100) {
this_data = i + 1 * 5 
container[[i]] = this_data
}

# make the loop occur 100 times 
# change the inside of the loop creatively 


# generate data using the for loop 
test_container = list()
for (i in 1:100) {
  school_a_data = rnorm(n = 65, mean = mean_school_a, sd = sd_school_a)
  school_b_data = rnorm(n = 65, mean = mean_school_b, sd = sd_school_b)
  t_test_result = t.test(school_a_data, school_b_data)$p.value
  result = ifelse(t_test_result < .05, 1, 0)
  test_container[[i]] = result
}

sum(do.call(rbind, test_container))

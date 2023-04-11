# Firstly I ensure the 'ToothGrowth' dataset is loaded 
data("ToothGrowth")

# Now I would like to view the dataset in its raw form 
View(ToothGrowth)

# Now I want to filter the dataset where dose = 0.5 and assigned it to a variable 
filtered_tg <- filter(ToothGrowth, dose==0.5)

# Again I want to view the dataset to check the filtered version
View(filtered_tg)

# Next I want to sort it by the length of tooth 
arrange(filtered_tg, len)

# HOWEVER, now I would like to archive the same result but with NESTED FUNCTIONS 
arrange(filter(ToothGrowth, dose==0.5), len)

# Finally, I would like to simplify this even more by using a PIPE
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose==0.5) %>% 
  group_by(supp) %>% 
  summarise(mean_len = mean(len,na.rm = T),.group='drop')
  arrange(len)

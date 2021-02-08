#Summary Information Script
#store summary information in a list. For example:

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)

#The file must compute at least 5 different values from your data that 
#you believe are pertinent to share. 






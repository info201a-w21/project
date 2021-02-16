# Aggregate Table Script

# You should create a table of aggregate information about it. 
# It must perform a groupby operation to show a dimension of 
#the dataset as grouped by a particular feature (column).
#We expect the included table to:
# 1.Have well formatted (i.e., human readable) column names 
# (so you'll probably have to change them)
# 2.Only contain relevant information (i.e., only select some columns of interest)
# 3.Be intentionally sorted in a meaningful way
# 4.Round any quantitative values so they are displayed in a manner that 
# isn't distracting
#When you display the table in your index.Rmd file, you must also describe 
#why you included the table, and what information it reveals.

library(tidyverse)
library(dplyr)


suicide_rate <- read.csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/suicide%20rate.csv?token=ASMKXP6DHKSYGYDADA7KGKDAGTXAU")
WHR_2016 <- read.csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/WHR2020/2016.csv?token=ASMKXP4TURU76S7WXIB7363AGTWZS")
Alcohol_Consumption <- read_csv("https://raw.githubusercontent.com/info201a-w21/project_AF/main/data/HappinessAlcoholConsumption.csv?token=ASMKXPZIFESXAGIONVNMDYDAGT43Y")

happiness_by_country <- WHR_2016 %>%
  group_by(Country) %>%
  select(Happiness.Score, Happiness.Rank) 

suicide_2016 <- suicide_rate %>%
  filter (X.1  == "2016") %>%
  group_by(X) %>%
  select(Crude.suicide.rates..per.100.000.population.) %>%
  rename(Country = "X") %>%
  rename(suicide_rate_per_100000_population = "Crude.suicide.rates..per.100.000.population.") %>%
  left_join(beer_consumption, by = "Country")
 

beer_consumption <- Alcohol_Consumption %>%
  group_by(Country) %>%
  select(Beer_PerCapita) %>%
  left_join(happiness_by_country, by = "Country")

view(suicide_2016)
  
  



